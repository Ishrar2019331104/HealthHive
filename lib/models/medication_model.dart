import 'package:flutter/material.dart';

class MedicationEntry {
  final DateTime date;
  final List<TimeOfDay> times;
  final List<String> medications;  // List of medication names for this day

  MedicationEntry({
    required this.date,
    required this.times,
    required this.medications,
  });
}

class Medication {
  final String medId;
  final String userId;
  final String medName;
  final String strength;
  final String dosage;
  final DateTime startDate;
  final DateTime endDate;

  Medication({
    required this.medId,
    required this.userId,
    required this.medName,
    required this.strength,
    required this.dosage,
    required this.startDate,
    required this.endDate,
  });
}
