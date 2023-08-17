import 'package:flutter/material.dart';
import 'package:health_hive/components/app_colors.dart';
import 'package:intl/intl.dart';

import '../../components/app_text.dart';
class HeightForm extends StatefulWidget {
  const HeightForm({Key? key}) : super(key: key);

  @override
  State<HeightForm> createState() => _HeightFormState();
}

class _HeightFormState extends State<HeightForm> {
  double height = 0;

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


  void _submitForm() {
    print("Height: $height");
  }

  String selectedScale = "cm"; // Set default scale
  final List<String> temperatureScales = ["cm", "ft/in"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.anchorGrey),
        title: AppText(text: 'Log height'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _submitForm();
              Navigator.pushNamed(context, '/logbook');
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
                  labelText: 'Height',
                  labelStyle: TextStyle(color: AppColors.anchorGrey),
                ),
                onChanged: (value) {
                  setState(() {
                    height = double.tryParse(value) ?? 0;
                  });
                },
              ),

              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedScale,
                onChanged: (newValue) {
                  setState(() {
                    selectedScale = newValue ?? "cm"; // Handle null value
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
                  labelText: 'Height unit',
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
    );
  }
}
