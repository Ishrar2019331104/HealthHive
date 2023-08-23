import 'package:flutter/material.dart';

class Symptom {
  String symptom;
  String description;
  DateTime selectedDate;
  TimeOfDay selectedTime;

  Symptom({
    required this.symptom,
    required this.description,
    required this.selectedDate,
    required this.selectedTime,
  });


  // implement validation logic here

}
