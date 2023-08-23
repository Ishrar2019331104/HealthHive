import 'package:health_hive/models/document_model.dart';
import 'package:flutter/material.dart';
import 'package:health_hive/providers/document_provider.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
class DocumentWidget extends StatelessWidget {

  final Document document;
  const DocumentWidget({Key? key, required this.document}) : super(key: key);

  Future<void> _openAttachment() async {


    try {
      await OpenFile.open(document.attachmentPath!);
    } catch (error) {
      print('Error opening file: $error');
    }

  }



  @override
  Widget build(BuildContext context) {
    return  Consumer<DocumentProvider>(
      builder:(context, documentProviderModel, child) => Card(
        elevation: 3,
        child: ListTile(

            leading: IconButton(
              icon: Icon(Icons.remove_red_eye, color: AppColors.anchorGrey),
              onPressed: _openAttachment, // Call the _openAttachment function
            ),
            title: Text('${document.title}'),

            subtitle: Text('${document.type} ${DateFormat('dd/MM/yy').format(document.date)}'),



        ),
      ),
    );
  }
}
