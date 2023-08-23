import 'package:flutter/material.dart';
import 'package:health_hive/models/document_model.dart';

class DocumentProvider with ChangeNotifier {
  List<Document> _documents = [];

  List<Document> get documents => _documents;

  void addDocument(Document newDocument) {
    _documents.insert(0, newDocument); // Insert at the beginning of the list
    notifyListeners();
  }


  void updateDocument(int index, Document updatedDocument) {
    _documents[index] = updatedDocument;
    notifyListeners();
  }

  void removeDocument(int index) {
    _documents.removeAt(index);
    notifyListeners();
  }
}
