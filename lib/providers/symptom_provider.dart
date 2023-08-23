import 'package:flutter/material.dart';
import 'package:health_hive/models/symptom_model.dart';

class SymptomProvider extends ChangeNotifier{

  List <Symptom> _symptoms = [];

  List <Symptom> get symptoms => _symptoms;

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

}