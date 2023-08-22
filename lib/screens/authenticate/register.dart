import 'package:flutter/material.dart';
import 'package:health_hive/models/userValidation.dart';
import 'package:health_hive/providers/user_provider.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/utils/app_text.dart';
import 'package:provider/provider.dart';

import 'login.dart';
class Register extends StatefulWidget {
  const Register({Key? key, required this.onSubmit}) : super(key: key);
  final ValueChanged<String> onSubmit;
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();


  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override


  bool checkValue = false;

  Widget build(BuildContext context) {
    return Consumer<UserProvider>(

      builder: (context, userProviderModel, child) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.anchorGrey
          ),
          title: AppText(
            text: 'Registration'
          ),
          backgroundColor: AppColors.slateGrey,
          elevation: 0,
        ),
        backgroundColor: AppColors.slateGrey,
        body: SingleChildScrollView(
          child: Container(
              padding:  EdgeInsets.fromLTRB(25, 11, 25, 116),
              child: Form(
                key: _formKey,
                child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Full name',
                              hintText: 'Enter your full name',
                              filled: true,
                              fillColor: Colors.white,

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none,
                              )
                          ),

                        ),
                        SizedBox(
                            height: 15
                        ),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter your email',
                              filled: true,
                              fillColor: Colors.white,

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none,
                              )
                          ),

                        ),
                        SizedBox(
                            height: 15
                        ),
                        TextField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              filled: true,
                              fillColor: Colors.white,

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none,
                              )
                          ),

                        ),
                        SizedBox(
                            height: 15
                        ),
                        TextField(
                          obscureText: true,
                          controller: _repeatPasswordController,
                          decoration: InputDecoration(
                              labelText: 'Repeat password',
                              hintText: 'Confirm your password',
                              filled: true,
                              fillColor: Colors.white,

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none,
                              )
                          ),

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              Checkbox(
                                value: checkValue, // Use the 'checkValue' variable to track the checkbox state
                                onChanged: (newValue) {
                                  setState(() {
                                    checkValue = newValue!; // Update the 'checkValue' when the checkbox is toggled
                                  });
                                },
                              ),
                              Text('I have read and agree to the "Terms of use".')
                            ],
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: (){
                                Navigator.pushNamed(context, '/terms');
                              },
                              child: Text('Terms of use'),
                              style: TextButton.styleFrom(
                                  primary: AppColors.anchorGrey,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                    fontSize: 14
                                )
                              ),

                            ),
                          ],
                        ),

                        SizedBox(
                            height: 10
                        ),

                        ElevatedButton(
                          onPressed: (){

                            String userEmail = _emailController.text;
                            String userPassword = _passwordController.text;
                            String userName = _nameController.text;
                            String repeatPassword = _repeatPasswordController.text;

                            // validation logic

                            String? passwordMatchError = UserValidation.validatePasswordMatch(
                              userPassword,
                              repeatPassword,
                            );

                            String? userEmailError = UserValidation.validateEmail(userEmail);
                            String? userNameError = UserValidation.validateEmail(userName);


                            if (passwordMatchError != null) {
                              // Passwords don't match, display an error message
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(passwordMatchError), duration: Duration(seconds: 2), behavior: SnackBarBehavior.floating, backgroundColor: Colors.redAccent,),
                              );
                            } else if (userNameError != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(userNameError), duration: Duration(seconds: 2), behavior: SnackBarBehavior.floating, backgroundColor: Colors.redAccent),
                              );
                            } else if (userEmailError != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(userEmailError), duration: Duration(seconds: 2), behavior: SnackBarBehavior.floating, backgroundColor: Colors.redAccent),
                              );
                            } else if(!checkValue) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Please agree to the terms and conditions'), duration: Duration(seconds: 2), behavior: SnackBarBehavior.floating, backgroundColor: Colors.redAccent),
                              );
                            }else {
                              // Passwords match, proceed with registration logic
                              userProviderModel.userEmail = userEmail;
                              userProviderModel.userPassword = userPassword;
                              userProviderModel.userName = userName;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Registration successful'), duration: Duration(seconds: 2), behavior: SnackBarBehavior.floating, backgroundColor: Colors.green),
                              );
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                                    (Route<dynamic> route) => false, // Removes all routes from the stack
                              );
                            }




                          },
                          child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              )
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.anchorGrey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 20)

                          ),
                        ),

                      ],
                    ),
              )

          ),
        ),
      ),
    );
  }
}
