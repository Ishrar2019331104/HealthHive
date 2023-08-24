import 'package:flutter/material.dart';

class LogbookEntry {
  String entryValue;
  String entryDataType;
  DateTime selectedDate;
  TimeOfDay selectedTime;
  String category;

  LogbookEntry({
    required this.entryValue,
    required this.entryDataType,
    required this.selectedTime,
    required this.selectedDate,
    required this.category
  });
}