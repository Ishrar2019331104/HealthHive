import 'package:flutter/material.dart';
import 'package:health_hive/components/app_colors.dart';
import 'package:health_hive/components/app_text.dart';
import 'package:intl/intl.dart';

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


  void _submitForm() {
    print("Blood pressure: $systole/$diastole on $selectedDate");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.anchorGrey),
        title: AppText(text: 'Log blood pressure'),
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
    );
  }
}