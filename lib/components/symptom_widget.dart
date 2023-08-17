import 'package:flutter/material.dart';
import 'package:health_hive/components/app_colors.dart';
import 'package:health_hive/components/symptom_card.dart';
class SymptomWidget extends StatelessWidget {

  final Symptom symptom;

  const SymptomWidget({Key? key, required this.symptom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 3,
      child: ListTile(

          leading: Icon(
            Icons.healing,
            color: AppColors.anchorGrey,
          ),
          title: Text('${symptom.symptom_name}'),

          subtitle: Text('${symptom.date} ${symptom.time}'),
          trailing: IconButton(
            icon: Icon(Icons.arrow_right),
            onPressed: (){},
          )

      ),
    );
  }
}
