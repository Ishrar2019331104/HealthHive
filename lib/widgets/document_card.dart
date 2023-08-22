
class Document {
  final String document_title;
  final String document_type;
  final String date;

  Document({required this.document_title,required this.document_type,required this.date});
}

class DocumentModel {
  static final doc_card = [
    Document(
      document_title: 'Blood report',
      document_type: 'Medical report',
      date: "17/08/23",
    ),


  ];
}