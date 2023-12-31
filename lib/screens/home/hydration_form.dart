import 'package:flutter/material.dart';
import 'package:health_hive/models/logbook_model.dart';
import 'package:health_hive/providers/logbook_provider.dart';
import 'package:health_hive/screens/home/logbook.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/utils/app_text.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HydrationForm extends StatefulWidget {
  const HydrationForm({Key? key}) : super(key: key);

  @override
  State<HydrationForm> createState() => _HydrationFormState();
}

class _HydrationFormState extends State<HydrationForm> {

  double water_level = 0;

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




  String selectedScale = "ml"; // Set default scale
  final List<String> temperatureScales = ["ml", "gallon", "oz", "cups"];




  @override
  Widget build(BuildContext context) {
    return Consumer<LogbookProvider>(
      builder: (context, logbookProviderModel, child) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.anchorGrey),
          title: AppText(text: 'Log hydration'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                final newLogbookEntry = LogbookEntry(
                    entryValue: water_level.toString(),
                    entryDataType: selectedScale,
                    selectedDate: selectedDate,
                    selectedTime: selectedTime,
                    category: 'hydration'


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
                    labelText: 'Hydration',
                    labelStyle: TextStyle(color: AppColors.anchorGrey),
                  ),
                  onChanged: (value) {
                    setState(() {
                      water_level = double.tryParse(value) ?? 0;
                    });
                  },
                ),

                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedScale,
                  onChanged: (newValue) {
                    setState(() {
                      selectedScale = newValue ?? "ml"; // Handle null value
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
                    labelText: 'Hydration unit',
                    labelStyle: TextStyle(color: AppColors.anchorGrey),
                  ),
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
