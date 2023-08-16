import 'package:flutter/material.dart';
import 'package:health_hive/components/app_colors.dart';
import 'package:health_hive/components/app_text.dart';

class MedicationForm extends StatefulWidget {
  const MedicationForm({Key? key}) : super(key: key);

  @override
  State<MedicationForm> createState() => _MedicationFormState();
}

class _MedicationFormState extends State<MedicationForm> {

  final _formKey = GlobalKey<FormState>();
  String _selectedDoseUnit = "Tablet";
  String _selectedSchedule = "Daily";
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _doseController = TextEditingController();

  final List<String> doseUnits = ['Tablet', 'Capsule', 'Syrup'];
  final List<String> schedules = ['Daily', 'Once a week', 'Twice a day', 'When needed'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: AppColors.anchorGrey
        ),
        title: AppText(
            text: 'Edit medication plan'
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName('/medications'));
            },
            icon: Icon(Icons.done, color: AppColors.anchorGrey),
          )
        ],
        backgroundColor: AppColors.slateGrey,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Medication',
                      labelStyle: TextStyle(
                          color: AppColors.anchorGrey
                      )
                  ),
                  validator: (value){
                    if(value==null ||value.isEmpty){
                      return 'Please enter a medication name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _doseController,
                  decoration: InputDecoration(
                    labelText: 'Dose',
                    labelStyle: TextStyle(
                      color: AppColors.anchorGrey
                    )
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value==null ||value.isEmpty){
                      return 'Please enter a dose';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _selectedDoseUnit,
                  onChanged: (newValue){
                    setState(() {
                      _selectedDoseUnit = newValue!;
                    });
                  },
                  items: doseUnits.map((unit){
                    return DropdownMenuItem(
                      value: unit,
                      child: Text(
                        unit,
                        style: TextStyle(
                          color: AppColors.anchorGrey
                        ),
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Dose Unit',
                      labelStyle: TextStyle(
                          color: AppColors.anchorGrey
                      )
                  ),
                ),
                SizedBox(
                  height: 16
                ),
                Text(
                    'Select Schedule: ',
                  style: TextStyle(
                    color: AppColors.anchorGrey
                  ),
                ),
                Column(
                  children: schedules.map((schedule){
                    return RadioListTile<String>(
                      title: Text(
                          schedule,
                        style: TextStyle(
                            color: AppColors.anchorGrey
                        ),
                      ),
                      value: schedule,
                      groupValue: _selectedSchedule,
                      onChanged: (value){
                        setState(() {
                          _selectedSchedule = value!;
                        });
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 16
                ),
                Row(
                  children: [
                    Text('Start Date: ',style: TextStyle(color: AppColors.anchorGrey)),
                    TextButton(
                      onPressed: () async {
                        final DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: _startDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101)
                        );
                        if(selectedDate != null && selectedDate != _startDate) {
                          setState(() {
                            _startDate = selectedDate;
                          });
                        }
                      },
                      child: Text('${_startDate.day}/${_startDate.month}/${_startDate.year}', style: TextStyle(color: AppColors.anchorGrey, fontWeight: FontWeight.w700)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('End Date: ',  style: TextStyle(color: AppColors.anchorGrey)),
                    TextButton(
                      onPressed: () async {
                        final DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: _endDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101)
                        );
                        if(selectedDate != null && selectedDate != _endDate) {
                          setState(() {
                            _endDate = selectedDate;
                          });
                        }
                      },
                      child: Text('${_endDate.day}/${_endDate.month}/${_endDate.year}',  style: TextStyle(color: AppColors.anchorGrey, fontWeight: FontWeight.w700)),
                    )
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
