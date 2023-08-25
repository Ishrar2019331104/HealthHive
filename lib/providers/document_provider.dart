import 'package:flutter/material.dart';
import 'package:health_hive/models/document_model.dart';

class DocumentProvider with ChangeNotifier {
  List<Document> _documents = [];
  List <Document> _selectedDocuments = [];
  List<Document> get documents => _documents;
  List<Document> get selectedDocuments => _selectedDocuments;

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

  void toggleDocumentSelection(Document document){
    if(_selectedDocuments.contains(document)){
      _selectedDocuments.remove(document);
    } else {
      _selectedDocuments.add(document);
    }
    notifyListeners();
  }

  void clearSelection() {
    selectedDocuments.clear();
    notifyListeners();
  }
}
