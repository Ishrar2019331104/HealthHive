import 'package:flutter/material.dart';
import 'package:health_hive/components/app_colors.dart';
import 'package:health_hive/components/app_text.dart';
import 'package:health_hive/components/document_card.dart';
import 'package:health_hive/components/document_widget.dart';

class Documents extends StatefulWidget {
  const Documents({Key? key}) : super(key: key);

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.anchorGrey,
        ),
        // username
        title: AppText(text: 'Documents'),
        backgroundColor: AppColors.slateGrey,
        elevation: 0,
        // add medication
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/documentform');
            },
            icon: Icon(
              Icons.add_box_rounded,
              size: 30,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.slateGrey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Documents",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.anchorGrey
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: DocumentModel.doc_card.length,
              itemBuilder: (context, index) {
                return DocumentWidget(document: DocumentModel.doc_card[index]);
              },
            ),
          ),
        ],
      ),
    );

  }
}
