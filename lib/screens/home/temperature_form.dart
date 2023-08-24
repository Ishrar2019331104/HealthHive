import 'dart:math';

import 'package:flutter/material.dart';
import 'package:health_hive/models/logbook_model.dart';
import 'package:health_hive/providers/logbook_provider.dart';
import 'package:health_hive/screens/home/logbook.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/utils/app_text.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class TemperatureForm extends StatefulWidget {
  const TemperatureForm({Key? key}) : super(key: key);

  @override
  State<TemperatureForm> createState() => _TemperatureFormState();
}

class _TemperatureFormState extends State<TemperatureForm> {
  double temperatureValue = 0;
  String selectedScale = "Fahrenheit"; // Set default scale
  final List<String> temperatureScales = ["Fahrenheit", "Celsius"]; // Renamed from 'doseUnits'

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
      builder: (context, logbookProviderModel, value) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.anchorGrey),
          title: AppText(text: 'Log temperature'),
          actions: <Widget>[
            IconButton(
              onPressed: () {

                final newLogbookEntry = LogbookEntry(
                  entryValue: temperatureValue.toString(),
                  entryDataType: selectedScale,
                  selectedDate: selectedDate,
                  selectedTime: selectedTime,
                  category: 'temperature'


                );

                logbookProviderModel.addEntry(0, newLogbookEntry);

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
                    labelText: 'Temperature',
                    labelStyle: TextStyle(color: AppColors.anchorGrey),
                  ),
                  onChanged: (value) {
                    setState(() {
                      temperatureValue = double.tryParse(value) ?? 0;
                    });
                  },
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedScale,
                  onChanged: (newValue) {
                    setState(() {
                      selectedScale = newValue ?? "Fahrenheit"; // Handle null value
                    });
                  },
                  items: temperatureScales.map((scale) {
                    return DropdownMenuItem(
                      value: scale,
                      child: Text(
                        scale,
                        style: TextStyle(color: AppColors.anchorGrey),
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Temperature Scale',
                    labelStyle: TextStyle(color: AppColors.anchorGrey),
                  ),
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
