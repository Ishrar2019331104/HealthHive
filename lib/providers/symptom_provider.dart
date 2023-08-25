import 'package:flutter/material.dart';
import 'package:health_hive/models/symptom_model.dart';

class SymptomProvider extends ChangeNotifier{

  List <Symptom> _symptoms = [];
  List <Symptom> _selectedSymptoms = [];

  List <Symptom> get symptoms => _symptoms;
  List <Symptom> get selectedSymptoms => _selectedSymptoms;

  void addSymptom(Symptom newSymptom) {
    _symptoms.insert(0, newSymptom);
    notifyListeners();
  }

  void updateSymptom(int index, Symptom updatedSymptom) {
    _symptoms[index] = updatedSymptom;
    notifyListeners();
  }
  void removeSymptom(int index) {
    _symptoms.removeAt(index);
    notifyListeners();
  }

  void toggleSymptomSelection(Symptom symptom){
    if(_selectedSymptoms.contains(symptom)){
      _selectedSymptoms.remove(symptom);
    } else {
      _selectedSymptoms.add(symptom);
    }
    notifyListeners();
  }

  void clearSelection() {
    _selectedSymptoms.clear();
    notifyListeners();
  }

}