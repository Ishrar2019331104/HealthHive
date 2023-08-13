import 'package:flutter/material.dart';
import 'package:health_hive/components/app_colors.dart';
import 'package:health_hive/components/app_text.dart';


class EditMedicationPlan extends StatefulWidget {
  const EditMedicationPlan({Key? key}) : super(key: key);

  @override
  State<EditMedicationPlan> createState() => _EditMedicationPlanState();
}

class _EditMedicationPlanState extends State<EditMedicationPlan> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
              color: AppColors.anchorGrey
          ),

          // username
          title: AppText(text: 'Edit medication plan'),
          backgroundColor: AppColors.slateGrey,
          elevation: 0,


          // add medication
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName('/medicationplan'));
            },
            icon: Icon(Icons.done, color: AppColors.anchorGrey),
          )
        ],
      ),
      backgroundColor: AppColors.slateGrey,

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  'Medication plan',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.anchorGrey
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView(

                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Name'
                    ),
                  ),

                ],
              )


            ],
          ),
        ),
      ),



    );
  }
}
