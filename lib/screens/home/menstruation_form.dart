import 'package:flutter/material.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/utils/app_text.dart';
import 'package:intl/intl.dart';

class MenstruationForm extends StatefulWidget {
  const MenstruationForm({Key? key}) : super(key: key);

  @override
  State<MenstruationForm> createState() => _MenstruationFormState();
}

class _MenstruationFormState extends State<MenstruationForm> {



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
    print("Date: $selectedDate");
  }

  String selectedFlow = "no flow"; // Set default scale
  final List<String> flowOptions = ["light", "medium", "heavy", "no flow", "unexpected flow"];

  String selectedColor = "none"; // Set default scale
  final List<String> colorOptions = ["none", "black", "brown", "dark red", "bright red", "pink", "orange", "grey"];

  String selectedConsistency = "none"; // Set default scale
  final List<String> consistencyOptions = ["none", "watery", "clots"];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.anchorGrey),
        title: AppText(text: 'Log menstruation'),
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



              DropdownButtonFormField<String>(
                value: selectedFlow,
                onChanged: (newValue) {
                  setState(() {
                    selectedFlow = newValue ?? "no flow"; // Handle null value
                  });
                },
                items: flowOptions.map((scale) {
                  return DropdownMenuItem(
                    value: scale,
                    child: Text(
                      scale,
                      style: TextStyle(color: AppColors.anchorGrey),
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Flow',
                  labelStyle: TextStyle(color: AppColors.anchorGrey),
                ),
              ),
              SizedBox(
                height: 16,
              ),

              DropdownButtonFormField<String>(
                value: selectedColor,
                onChanged: (newValue) {
                  setState(() {
                    selectedColor = newValue ?? "none"; // Handle null value
                  });
                },
                items: colorOptions.map((scale) {
                  return DropdownMenuItem(
                    value: scale,
                    child: Text(
                      scale,
                      style: TextStyle(color: AppColors.anchorGrey),
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Color',
                  labelStyle: TextStyle(color: AppColors.anchorGrey),
                ),
              ),
              SizedBox(
                height: 16,
              ),

              DropdownButtonFormField<String>(
                value: selectedConsistency,
                onChanged: (newValue) {
                  setState(() {
                    selectedConsistency = newValue ?? "none"; // Handle null value
                  });
                },
                items: consistencyOptions.map((scale) {
                  return DropdownMenuItem(
                    value: scale,
                    child: Text(
                      scale,
                      style: TextStyle(color: AppColors.anchorGrey),
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Consistency',
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
