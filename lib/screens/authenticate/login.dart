import 'package:flutter/material.dart';
import 'package:health_hive/components/app_colors.dart';
import 'package:health_hive/components/app_text.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.slateGrey,
      body: SingleChildScrollView(
        child: Container(

          padding:  EdgeInsets.fromLTRB(25, 11, 25, 116),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Email',
                    style: TextStyle(
                      color: AppColors.anchorGrey
                    ),
                  )
                ],
              ),
              SizedBox(
                  height: 5
              ),
              TextFormField(
                decoration: InputDecoration(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Password',
                    style: TextStyle(
                        color: AppColors.anchorGrey
                    ),
                  )
                ],
              ),
              SizedBox(
                  height: 5
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    )
                ),
              ),
              SizedBox(
                  height: 70
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/dashboard');
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
    );
  }
}
