import 'package:flutter/material.dart';
import 'package:health_hive/models/logbook_model.dart';


class LogbookProvider extends ChangeNotifier{

  List <LogbookEntry> _logbookentries = [];

  List <LogbookEntry> get logbookentries => _logbookentries;

  void addEntry(int index, LogbookEntry newLogbookEntry) {
    _logbookentries.insert(index, newLogbookEntry);
    notifyListeners();
  }
  void updateEntry(int index, LogbookEntry updatedLogbookEntry) {
    _logbookentries[index] = updatedLogbookEntry;
    notifyListeners();
  }
  void removeEntry(int index) {
    _logbookentries.removeAt(index);
    notifyListeners();
  }



}