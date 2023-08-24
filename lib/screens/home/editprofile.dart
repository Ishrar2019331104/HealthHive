import 'package:flutter/material.dart';
import 'package:health_hive/providers/user_provider.dart';
import 'package:health_hive/screens/home/dashboard.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/utils/app_text.dart';
import 'package:provider/provider.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.anchorGrey
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: AppColors.anchorGrey
              )
            ),
          ),
            child: child!
        );
      }
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  InputDecoration _getDisabledInputDecoration(String labelText) {
    return InputDecoration(
      labelStyle: TextStyle(
        color: Colors.grey, // Set the label color for disabled fields
      ),
      labelText: labelText,
      filled: true,
      fillColor: Colors.grey.shade200, // Set the fill color for disabled fields
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),

      ),
    );
  }


  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProviderModel, child) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: AppColors.anchorGrey
          ),
          title: AppText(
              text: 'Edit Profile'
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                      (Route<dynamic> route) => false,
                );

              },
              icon: Icon(Icons.done, color: AppColors.anchorGrey),
            )
          ],
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



                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Full name',
                        labelStyle: TextStyle(
                          color: AppColors.anchorGrey,
                        ),
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


                  TextFormField(
                    initialValue: userProviderModel.userEmail, // Set initial value

                    readOnly: true,
                    decoration: _getDisabledInputDecoration('Email'),
                  ),

                  SizedBox(
                      height: 15
                  ),




                  TextFormField(
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                          color: AppColors.anchorGrey,
                        ),
                        labelText: 'Gender',
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

                  TextFormField(
                    onTap: (){
                      _selectDate(context);
                    },
                    readOnly: true,
                    controller: TextEditingController(
                      text: '${selectedDate.toLocal()}'.split(' ')[0],
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        labelStyle: TextStyle(
                          color: AppColors.anchorGrey
                        ),
                        labelText: 'Birthday',
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

                  TextFormField(
                    readOnly: true,
                    decoration:  _getDisabledInputDecoration('Weight'),
                  ),
                  SizedBox(
                      height: 15
                  ),

                  TextFormField(

                    decoration: _getDisabledInputDecoration('Height'),
                    readOnly: true,
                  ),
                  SizedBox(
                      height: 15
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                            color: AppColors.anchorGrey
                        ),
                        labelText: 'Blood group',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ElevatedButton(
                        child: const Text(
                          'Chronic Illness',
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.anchorGrey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                          ),


                        ),

                      ),
                      ElevatedButton(
                        child: const Text(
                          'Allergies',
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.anchorGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                            ),


                        ),
                      ),
                    ],
                  )



                ],
              )
          ),
        ),
      ),
    );
  }
}
