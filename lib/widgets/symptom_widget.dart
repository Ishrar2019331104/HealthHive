import 'package:flutter/material.dart';
import 'package:health_hive/models/symptom_model.dart';
import 'package:health_hive/providers/symptom_provider.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
class SymptomWidget extends StatelessWidget {

  final Symptom symptom;

  const SymptomWidget({Key? key, required this.symptom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Consumer<SymptomProvider>(
      builder: (context, symptomProviderModel, child) => Card(
        elevation: 3,
        child: ListTile(

            leading: Icon(
              Icons.healing,
              color: AppColors.anchorGrey,
            ),
            title: Text('${symptom.symptom}'),

            subtitle: Text('${DateFormat('MMMM d, yyyy').format(symptom.selectedDate)} ${symptom.selectedTime.format(context)}'),
            trailing: IconButton(
              icon: Icon(Icons.arrow_right),
              onPressed: (){
                showModalBottomSheet(
                  backgroundColor: AppColors.anchorGrey,

                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                      )
                    ),
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[

                        ListTile(
                          title: Text(
                            '${symptom.symptom}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),
                          ),
                          subtitle: Text(
                            '${symptom.description}',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),

                        ListTile(
                          title: Text(
                              'Delete symptom',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                          trailing: Icon(
                              Icons.delete,
                            color: Colors.red,
                          ),
                          onTap: (){
                            int index = symptomProviderModel.symptoms.indexOf(symptom);
                            symptomProviderModel.removeSymptom(index);
                            Navigator.pop(context);
                          },
                        )
                      ],
                    )
                );
              },
            )

        ),
      ),
    );
  }
}
