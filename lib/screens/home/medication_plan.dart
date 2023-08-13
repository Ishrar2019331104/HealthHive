import 'package:flutter/material.dart';
import '../../components/app_card.dart';
import '../../components/app_colors.dart';
import '../../components/app_text.dart';

class MedicationPlan extends StatefulWidget {
  const MedicationPlan({Key? key}) : super(key: key);

  @override
  State<MedicationPlan> createState() => _MedicationPlanState();
}

class _MedicationPlanState extends State<MedicationPlan> {
  @override


  String username = 'Ishrar Chowdhury';

  List <String> medList = ['paracetamol', 'ace', 'avil'];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.slateGrey,
      appBar: AppBar(
          iconTheme: IconThemeData(
              color: AppColors.anchorGrey
          ),

          // username
          title: AppText(text: 'Hello, $username'),
          backgroundColor: AppColors.slateGrey,
          elevation: 0,


          // add medication
          actions: <Widget> [
            IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/editmedicationplan');
                },
                icon: Icon(
                  Icons.add_box_rounded,
                  size: 30,
                )
            )
          ]
      ),


      body: ListView.builder(
        itemCount: medList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = medList[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.anchorGrey
                ),
              ),
            ),
          );
        },
      ),


    );
  }
}
