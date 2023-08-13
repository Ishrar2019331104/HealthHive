import 'package:flutter/material.dart';
import 'package:health_hive/components/app_colors.dart';
import 'package:health_hive/components/app_text.dart';
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

  Widget build(BuildContext context) {
    return Scaffold(
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
              Navigator.of(context).popUntil(ModalRoute.withName('/dashboard'));
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
                      'Phone',
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
                      'City',
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
                      'Country',
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
                      'Gender',
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
                      'Birthday',
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
                  onTap: (){
                    _selectDate(context);
                  },
                  readOnly: true,
                  controller: TextEditingController(
                    text: '${selectedDate.toLocal()}'.split(' ')[0]
                  ),
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
                      'Weight',
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
                      'Height',
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
                      'Blood type',
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


              ],
            )
        ),
      ),
    );
  }
}
