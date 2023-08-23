class Document {
  String title;
  String type;
  DateTime date;
  String? attachmentPath;

  Document({
    required this.title,
    required this.type,
    required this.date,
    required this.attachmentPath,
  });
}
