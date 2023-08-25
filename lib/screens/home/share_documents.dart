import 'package:flutter/material.dart';
import 'package:health_hive/providers/document_provider.dart';
import 'package:health_hive/providers/symptom_provider.dart';
import 'package:health_hive/screens/home/dashboard.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/utils/app_text.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';



class ShareDocuments extends StatefulWidget {
  const ShareDocuments({Key? key}) : super(key: key);

  @override
  State<ShareDocuments> createState() => _ShareDocumentsState();
}

class _ShareDocumentsState extends State<ShareDocuments> {

  Future<void> _openAttachment(String attachmentPath) async {
    try {
      await OpenFile.open(attachmentPath);
    } catch (error) {
      print('Error opening file: $error');
    }
  }

  @override
  Widget build(BuildContext context) {

    final documentProvider = Provider.of<DocumentProvider>(context);
    final symptomProvider = Provider.of<SymptomProvider>(context);


    final selectedDocuments = documentProvider.selectedDocuments;
    final selectedSymptoms = symptomProvider.selectedSymptoms;


    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'Share records'),
        backgroundColor: AppColors.slateGrey,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: AppColors.anchorGrey,
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
                  (Route<dynamic> route) => false,
            ); // Navigate back when the button is pressed
          }
        ),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.mobile_screen_share),
            onPressed: (){

              showDialog(
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    title: Center(child: Text(
                        'Generating code',
                      style: TextStyle(
                        color: AppColors.anchorGrey
                      ),
                    )),
                    content: Text(
                        'The selected documents and symptoms will be shared with the doctor',
                        style: TextStyle(
                            color: AppColors.anchorGrey
                        )
                    ),
                    actions: [
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Text('Keep sharing', style: TextStyle(
                            color: AppColors.anchorGrey
                        )),
                      ),
                      TextButton(
                        onPressed: () {
                          // Code to handle "Cancel Sharing" button press
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text(
                          'Cancel Sharing',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  );
                }
              );

            },
            color: AppColors.anchorGrey,
          )
        ],


      ),
      backgroundColor: AppColors.slateGrey,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                  'Select documents',
                style: TextStyle(
                  color: AppColors.anchorGrey,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: ListView.builder(
                itemCount: documentProvider.documents.length,
                itemBuilder: (context, index){
                  final document = documentProvider.documents[index];
                  final isSelected = selectedDocuments.contains(document);

                  return CheckboxListTile(
                    title: Text(document.title),
                    subtitle: Text('${DateFormat('dd/MM/yy').format(document.date)}'),
                    value: isSelected,
                    activeColor: AppColors.anchorGrey,
                    secondary: IconButton(
                      icon: Icon(
                          Icons.open_with,
                        color: AppColors.anchorGrey,
                      ),
                      onPressed: (){
                        _openAttachment(document.attachmentPath!);
                      }
                    ),
                    onChanged: (newValue) {
                      if(newValue!){
                        documentProvider.toggleDocumentSelection(document);
                      } else {
                        documentProvider.toggleDocumentSelection(document);
                      }
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Select symptoms',
                style: TextStyle(
                    color: AppColors.anchorGrey,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: ListView.builder(
                itemCount: symptomProvider.symptoms.length,
                itemBuilder: (context, index){
                  final symptom = symptomProvider.symptoms[index];
                  final isSelected = selectedSymptoms.contains(symptom);

                  return CheckboxListTile(
                    title: Text(symptom.symptom),
                    subtitle: Text('${DateFormat('dd/MM/yy').format(symptom.selectedDate)}'),
                    value: isSelected,
                    activeColor: AppColors.anchorGrey,
                    secondary: IconButton(
                      icon: Icon(Icons.warning_amber_sharp),
                      onPressed: (){},
                      color: AppColors.anchorGrey,
                    ),
                    onChanged: (newValue) {
                      if(newValue!){
                        symptomProvider.toggleSymptomSelection(symptom);
                      } else {
                        symptomProvider.toggleSymptomSelection(symptom);
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),

    );
  }
}
