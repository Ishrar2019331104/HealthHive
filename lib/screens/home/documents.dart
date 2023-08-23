import 'package:flutter/material.dart';
import 'package:health_hive/providers/document_provider.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/utils/app_text.dart';
import 'package:health_hive/widgets/document_card.dart';
import 'package:health_hive/widgets/document_widget.dart';
import 'package:provider/provider.dart';

class Documents extends StatefulWidget {
  const Documents({Key? key}) : super(key: key);

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DocumentProvider>(
      builder: (context, documentProviderModel, child) => Scaffold(
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
                itemCount: documentProviderModel.documents.length,
                itemBuilder: (context, index) {
                  final document = documentProviderModel.documents[index];
                  return Dismissible(
                    key: Key(document.title), // Unique key for the dismissible item
                    direction: DismissDirection.endToStart, // Swipe from end to start
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        // Delete the document from the provider
                        documentProviderModel.removeDocument(index);

                        // Show a snackbar to indicate that the document has been deleted
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text('Document "${document.title}" deleted'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Add the document back to the list if user wants to undo
                                documentProviderModel.addDocument(document);
                              },
                            ),
                          ),
                        );
                      }
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    child: DocumentWidget(document: document),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );

  }
}
