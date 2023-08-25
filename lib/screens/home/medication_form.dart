import 'package:flutter/material.dart';
import 'package:health_hive/models/medication_model.dart';
import 'package:health_hive/providers/medication_provider.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/utils/app_text.dart';
import 'package:provider/provider.dart';

class MedicationForm extends StatefulWidget {
  const MedicationForm({Key? key}) : super(key: key);

  @override
  State<MedicationForm> createState() => _MedicationFormState();
}

class _MedicationFormState extends State<MedicationForm> {

  final _formKey = GlobalKey<FormState>();
  String _selectedDoseUnit = "gram(s)";
  String _selectedSchedule = "When needed";
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  int frequency = 0;
  int days = 0;
  List<String> selectedDaysOfWeek = [];
  List<TimeOfDay> selectedTimes = [];

  TextEditingController _nameController = TextEditingController();
  TextEditingController _doseController = TextEditingController();

  final List<String> doseUnits = ['gram(s)', 'capsule(s)', 'milligram(s)', 'injection(s)', 'piece(s)', 'tablet(s)', 'unit(s)'];
  final List<String> schedules = ['When needed', 'Every X days', 'Specific days of week'];



  void increaseFrequency(){
    setState(() {
      frequency++;

    });
  }
  void decreaseFrequency(){
    if(frequency>0){
      setState(() {
        frequency--;
      });
    }
  }
  void increaseDays(){
    setState(() {
      days++;
    });
  }
  void decreaseDays(){
    if(days>0){
      setState(() {
        days--;
      });
    }
  }

  List<Widget> _buildDayOfWeekCheckboxes() {
    const List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return daysOfWeek.map((day) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,


          children: [
            Checkbox(
              activeColor: AppColors.anchorGrey,
              value: selectedDaysOfWeek.contains(day),
              onChanged: (value) {
                setState(() {
                  if (value == true) {
                    selectedDaysOfWeek.add(day);
                  } else {
                    selectedDaysOfWeek.remove(day);
                  }
                });
              },
            ),
            Text(
              day,
              style: TextStyle(
                color: AppColors.anchorGrey,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<MedicationProvider>(
      builder: (context, medicationProviderModel, child) => Scaffold(
        backgroundColor: AppColors.slateGrey,
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
                if (_formKey.currentState!.validate()) {
                  List<MedicationEntry> medicationEntries = [];

                  if (_selectedSchedule == 'Every X days') {
                    final daysDifference = _endDate.difference(_startDate).inDays;
                    for (int i = 0; i <= daysDifference; i += days) {
                      final currentDate = _startDate.add(Duration(days: i));

                      final selectedEntryTimes = selectedTimes.map((time) {
                        return TimeOfDay(hour: time.hour, minute: time.minute);
                      }).toList();

                      final entry = MedicationEntry(
                        date: currentDate,
                        times: List.from(selectedEntryTimes),
                        medications: [_nameController.text],
                      );

                      medicationEntries.add(entry);
                    }
                  }  else if (_selectedSchedule == 'Specific days of week') {
                    for (String day in selectedDaysOfWeek) {
                      final dayIndex = selectedDaysOfWeek.indexOf(day);
                      final currentDate = _startDate.add(Duration(days: dayIndex));

                      final selectedEntryTimes = selectedTimes.map((time) {
                        return TimeOfDay(hour: time.hour, minute: time.minute);
                      }).toList();

                      final entry = MedicationEntry(
                        date: currentDate,
                        times: List.from(selectedEntryTimes),
                        medications: [_nameController.text],
                      );



                      medicationEntries.add(entry);





                    }


                  }
                  print(medicationEntries.length);

                  for(final entry in medicationEntries){

                    medicationProviderModel.addMedicationEntry(entry);

                  }
                  print('Contents of medicationProviderModel:');
                  for (var entry in medicationProviderModel.medicationEntries) {
                    print('Entry Date: ${entry.date} Entry medications:  ${entry.medications}');

                  }




                  Navigator.of(context).popUntil(ModalRoute.withName('/medications'));
                }
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
                            , fontWeight: FontWeight.w700
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
                        color: AppColors.anchorGrey,
                          fontWeight: FontWeight.w700
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
                            , fontWeight: FontWeight.w700
                        )
                    ),
                  ),
                  SizedBox(
                    height: 16
                  ),
                  Text(
                      'Select Schedule: ',
                    style: TextStyle(
                      color: AppColors.anchorGrey, fontWeight: FontWeight.w700
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
                        activeColor: AppColors.anchorGrey,
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

                  Visibility(
                    visible: _selectedSchedule != 'When needed',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Visibility(
                          visible: _selectedSchedule == 'Every X days',
                          child:  Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Every',
                                  style: TextStyle(
                                      fontSize: 16
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: AppColors.anchorGrey,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      IconButton(
                                        onPressed: (){
                                          decreaseDays();
                                        },
                                        icon: Icon(Icons.remove),
                                        color: Colors.white,
                                      ),


                                      Text(
                                        '$days',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20
                                        ),
                                      ),

                                      IconButton(
                                        onPressed: (){
                                          increaseDays();
                                        },
                                        icon: Icon(Icons.add),
                                        color: Colors.white,
                                      ),

                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'days',
                                  style: TextStyle(
                                      fontSize: 16
                                  ),
                                ),
                              ],

                            ),
                          ),

                        ),

                        Visibility(
                          visible: _selectedSchedule == 'Specific days of week',
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Wrap(
                                  spacing: 8,
                                  alignment: WrapAlignment.start,
                                  children: _buildDayOfWeekCheckboxes(),
                                ),
                              )
                            ],
                          )

                        ),




                        Text(
                          'Frequency: ',
                          style: TextStyle(
                              color: AppColors.anchorGrey,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Take',
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                    color: AppColors.anchorGrey,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: (){
                                        decreaseFrequency();
                                      },
                                      icon: Icon(Icons.remove),
                                      color: Colors.white,
                                    ),


                                    Text(
                                      '$frequency',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20
                                      ),
                                    ),

                                    IconButton(
                                      onPressed: (){
                                        increaseFrequency();
                                      },
                                      icon: Icon(Icons.add),
                                      color: Colors.white,
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'times',
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              ),
                            ],

                          ),
                        ),

                        Wrap(
                          spacing: 10,
                          alignment: WrapAlignment.center,
                          children: List.generate(frequency, (index) {
                            TimeOfDay initialTime = selectedTimes.length > index
                                ? selectedTimes[index]
                                : TimeOfDay.now();

                            return TextButton(
                              onPressed: () async {
                                final selectedTime = await showTimePicker(
                                  context: context,
                                  initialTime: initialTime,
                                );

                                print('Selected times before update: $selectedTimes');

                                if (selectedTime != null) {
                                  setState(() {
                                    while (selectedTimes.length <= index) {
                                      selectedTimes.add(TimeOfDay.now());
                                    }
                                    selectedTimes[index] = selectedTime;
                                  });
                                }

                                print('Selected times after update: $selectedTimes');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: AppColors.anchorGrey,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    initialTime.format(context).replaceAll(RegExp('[APMapm]'), ''),
                                    style: TextStyle(
                                      color: AppColors.anchorGrey,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        )



                      ],
                    ),
                  ),

                  SizedBox(
                    height: 16
                  ),
                  Row(
                    children: [
                      Text('Start Date: ',style: TextStyle(color: AppColors.anchorGrey, fontWeight: FontWeight.w700)),
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
                        child: Text('${_startDate.day}/${_startDate.month}/${_startDate.year}', style: TextStyle(color: AppColors.anchorGrey)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text('End Date: ',  style: TextStyle(color: AppColors.anchorGrey, fontWeight: FontWeight.w700)),
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
                        child: Text('${_endDate.day}/${_endDate.month}/${_endDate.year}',  style: TextStyle(color: AppColors.anchorGrey)),
                      )
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
