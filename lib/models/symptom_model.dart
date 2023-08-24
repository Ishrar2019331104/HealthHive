import 'package:flutter/material.dart';

class Symptom {
  String symptom;
  String description;
  DateTime selectedDate;
  TimeOfDay selectedTime;
  bool isChecked;


  Symptom({
    required this.symptom,
    required this.description,
    required this.selectedDate,
    required this.selectedTime,
    this.isChecked = false
  });


  // implement validation logic here

}
