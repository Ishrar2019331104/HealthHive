import 'package:health_hive/models/medication_model.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
class MedicationProvider extends ChangeNotifier {
  List<Medication> _medications = [];
  List<MedicationEntry> _medicationEntries = [];

  List<Medication> get medications => _medications;
  List<MedicationEntry> get medicationEntries => _medicationEntries;


  void addMedication(Medication medication) {
    _medications.add(medication);
    notifyListeners();
  }

  void addMedicationEntry(MedicationEntry entry){
    _medicationEntries.add(entry);
    notifyListeners();
  }

  List<MedicationEntry> getMedicationEntriesForDate(DateTime date) {
    return medicationEntries.where((entry) {
      return isSameDay(entry.date, date);
    }).toList();
  }
}
