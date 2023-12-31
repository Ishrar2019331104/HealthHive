import 'package:flutter/material.dart';
import 'package:health_hive/models/logbook_model.dart';
import 'package:health_hive/providers/logbook_provider.dart';
import 'package:health_hive/screens/home/logbook.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/utils/app_text.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BloodPressureForm extends StatefulWidget {
  const BloodPressureForm({Key? key}) : super(key: key);

  @override
  State<BloodPressureForm> createState() => _BloodPressureFormState();
}

class _BloodPressureFormState extends State<BloodPressureForm> {

  int systole = 0;
  int diastole = 0;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate)
      setState(() {
        selectedDate = pickedDate;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime)
      setState(() {
        selectedTime = pickedTime;
      });
  }





  @override
  Widget build(BuildContext context) {
    return Consumer<LogbookProvider>(
      builder: (context, logbookProviderModel, child) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.anchorGrey),
          title: AppText(text: 'Log blood pressure'),
          actions: <Widget>[
            IconButton(
              onPressed: () {

                // final newBloodPressure = BloodPressure(
                //   systole: systole,
                //   diastole: diastole,
                //   selectedDate: selectedDate,
                //   selectedTime: selectedTime
                // );
                //
                // bloodPressureProviderModel.addBloodPressure(0, newBloodPressure);
                //
                // Navigator.popUntil(context, ModalRoute.withName('/logbook'));


              final newLogbookEntry = LogbookEntry(
                entryValue: '$systole/$diastole',
                entryDataType: 'mmHg',
                selectedDate: selectedDate,
                selectedTime: selectedTime,
                category: 'bloodpressure'
              );

              logbookProviderModel.addEntry(0, newLogbookEntry);

              // print(newLogbookEntry.entryValue);

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Logbook()),
                    (Route<dynamic> route) => false,
              );


              },
              icon: Icon(Icons.done, color: AppColors.anchorGrey),
            )
          ],
          backgroundColor: AppColors.slateGrey,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Systole',
                    labelStyle: TextStyle(color: AppColors.anchorGrey),
                  ),
                  onChanged: (value) {
                    setState(() {
                      systole = int.tryParse(value) ?? 0;
                    });
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Diastole',
                    labelStyle: TextStyle(color: AppColors.anchorGrey),
                  ),
                  onChanged: (value) {
                    setState(() {
                      diastole = int.tryParse(value) ?? 0;
                    });
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: Text('Select Date'),
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.anchorGrey
                      ),
                    ),
                    Text(
                        '${dateFormat.format(selectedDate)}',
                      style: TextStyle(
                        color: AppColors.anchorGrey,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => _selectTime(context),
                      child: Text('Select Time'),
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.anchorGrey
                      ),

                    ),
                    Text('${selectedTime.format(context)}',
                      style: TextStyle(
                          color: AppColors.anchorGrey,
                          fontWeight: FontWeight.w700
                      ),),

                  ],
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
