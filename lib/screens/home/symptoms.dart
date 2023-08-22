import 'package:flutter/material.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/utils/app_text.dart';
import 'package:health_hive/widgets/symptom_card.dart';
import 'package:health_hive/widgets/symptom_widget.dart';

class Symptoms extends StatefulWidget {
  const Symptoms({Key? key}) : super(key: key);

  @override
  State<Symptoms> createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.slateGrey,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.anchorGrey,
        ),
        // username
        title: AppText(text: 'Symptoms'),
        backgroundColor: AppColors.slateGrey,
        elevation: 0,
        // add medication
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/symptomform');
            },
            icon: Icon(
              Icons.add_box_rounded,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Symptoms",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.anchorGrey
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: SymptomModel.symp_card.length,
              itemBuilder: (context, index) {
                return SymptomWidget(symptom: SymptomModel.symp_card[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
