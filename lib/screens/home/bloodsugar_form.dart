import 'package:flutter/material.dart';
import 'package:health_hive/models/logbook_model.dart';
import 'package:health_hive/providers/logbook_provider.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/utils/app_text.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
class BloodSugarForm extends StatefulWidget {
  const BloodSugarForm({Key? key}) : super(key: key);

  @override
  State<BloodSugarForm> createState() => _BloodSugarFormState();
}

class _BloodSugarFormState extends State<BloodSugarForm> {


  double sugar_level = 0;

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
          title: AppText(text: 'Log blood sugar'),
          actions: <Widget>[
            IconButton(
              onPressed: () {

                final newLogbookEntry = LogbookEntry(
                  entryValue: sugar_level.toString(),
                  entryDataType: 'mg/dL',
                  selectedDate: selectedDate,
                  selectedTime: selectedTime,
                  category: 'bloodsugar'
                );

                logbookProviderModel.addEntry(0, newLogbookEntry);

                Navigator.popUntil(context, ModalRoute.withName('/logbook'));
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
                    labelText: 'Sugar level',
                    labelStyle: TextStyle(color: AppColors.anchorGrey),
                  ),
                  onChanged: (value) {
                    setState(() {
                      sugar_level = double.tryParse(value) ?? 0;
                    });
                  },
                ),
                SizedBox(height: 16),

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

