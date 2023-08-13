import 'package:flutter/material.dart';
import 'package:health_hive/components/app_colors.dart';
import 'package:health_hive/components/app_text.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Full Name',
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
                    height: 15
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Repeat password',
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
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: true,
                        onChanged: (bool){},

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
                  onPressed: (){},
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
            )
        ),
      ),
    );
  }
}
