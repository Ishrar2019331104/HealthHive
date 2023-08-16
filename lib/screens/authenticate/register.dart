import 'package:flutter/material.dart';
import 'package:health_hive/components/app_colors.dart';
import 'package:health_hive/components/app_text.dart';
class Register extends StatefulWidget {
  const Register({Key? key, required this.onSubmit}) : super(key: key);
  final ValueChanged<String> onSubmit;
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  bool _submitted = false;

  String _userName = '';
  String _userEmail = '';
  String _userPassword = '';
  String _repeatPassword = '';

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();

  void dispose(){
    _passwordController.dispose();
    _nameController.dispose();
    _repeatPasswordController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  String? get _errorText{
    final text = _nameController.value.text;

    if(text.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;

  }

  void _submit(){
    setState(()=> _submitted = true);
    if(_errorText == null){
      widget.onSubmit(_nameController.value.text);
    }
  }

  @override


  bool checkValue = false;

  Widget build(BuildContext context) {
    return Scaffold(
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
            child: ValueListenableBuilder(
              valueListenable: _nameController,
              builder: (context, TextEditingValue value, __) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Full name',
                          hintText: 'Enter your full name',
                          filled: true,
                          fillColor: Colors.white,
                          errorText: _submitted? _errorText : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          )
                      ),
                      onChanged: (text) => setState(() => _nameController.text = text),
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
                          errorText: _submitted? _errorText : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          )
                      ),
                      onChanged: (text) => setState(() => _emailController.text = text),
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
                          errorText: _submitted? _errorText : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          )
                      ),
                      onChanged: (text) => setState(() => _passwordController.text = text),
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
                          errorText: _submitted? _errorText : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          )
                      ),
                      onChanged: (text) => setState(() => _repeatPasswordController.text = text),
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
                            Navigator.of(context).popUntil(ModalRoute.withName('/login'));
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
                        if (_nameController.value.text.isNotEmpty &&
                            _emailController.value.text.isNotEmpty &&
                            _passwordController.value.text.isNotEmpty &&
                            _repeatPasswordController.value.text.isNotEmpty && checkValue==true &&
                            _errorText == null)
                        {
                          _submit(); // Call the _submit function when conditions are met
                          Navigator.pushNamed(context, '/login');
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
                );
              }
            )
        ),
      ),
    );
  }
}
