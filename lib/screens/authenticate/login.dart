import 'package:flutter/material.dart';
import 'package:health_hive/models/userValidation.dart';
import 'package:health_hive/providers/user_provider.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/utils/app_text.dart';
import 'package:health_hive/screens/authenticate/register.dart';
import 'package:health_hive/screens/home/dashboard.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}



class _LoginState extends State<Login> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProviderModel, child) => Scaffold(
        backgroundColor: AppColors.slateGrey,
        body: SingleChildScrollView(
          child: Container(

            padding: EdgeInsets.fromLTRB(25, 11, 25, 116),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                      child: AppText(
                        text: 'HealthHive'
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50
                ),


                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(
                    height: 15
                ),

                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(
                    height: 70
                ),
                ElevatedButton(
                  onPressed: (){

                    String userEmail = _emailController.text;
                    String userPassword = _passwordController.text;

                    // some sort of validation

                    if(UserValidation.validateEmail(userEmail) == null && UserValidation.validatePassword(userPassword) == null) {
                      userProviderModel.userEmail = userEmail;
                      userProviderModel.userPassword = userPassword;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Dashboard()
                      ));
                    }



                  },
                  child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Login',
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
                SizedBox(
                  height: 180,
                ),
                Text(
                    'Dont have an account?',
                  style: TextStyle(
                    color: AppColors.anchorGrey
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                OutlinedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Create new account',
                        style: TextStyle(
                            fontSize: 14,
                          color: AppColors.anchorGrey
                        ),
                      )
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    side: BorderSide(color: AppColors.anchorGrey),
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20)
                  ),


                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
