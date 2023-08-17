import 'package:flutter/material.dart';
import 'package:health_hive/components/app_colors.dart';
import 'package:health_hive/components/app_text.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class DocumentForm extends StatefulWidget {
  const DocumentForm({Key? key}) : super(key: key);

  @override
  State<DocumentForm> createState() => _DocumentFormState();
}

class _DocumentFormState extends State<DocumentForm> {


  String title = '';

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate)
      setState(() {
        selectedDate = pickedDate;
      });
  }




  void _submitForm() {
    print("Title: $title");
  }

  String selectedType = "None"; // Set default scale
  final List<String> documentType = ["None", "Diagnostic Imaging", "Epicrisis", "Prescription", "Laboratory results", "Medication report", "Referral", "Others"];


  // Inside _DocumentFormState class
  Future<void> _attachFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      String filePath = result.files.single.path!;
      // Handle the selected file path here
    }
  }

  Future<void> _attachPhoto() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      String imagePath = pickedFile.path;
      // Handle the selected image path here
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.anchorGrey),
        title: AppText(text: 'Add document'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _submitForm();
              Navigator.popUntil(context, ModalRoute.withName('/documents'));

            },
            icon: Icon(Icons.done, color: AppColors.anchorGrey),
          )
        ],
        backgroundColor: AppColors.slateGrey,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(color: AppColors.anchorGrey),
                ),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),

              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedType,
                onChanged: (newValue) {
                  setState(() {
                    selectedType = newValue ?? "None"; // Handle null value
                  });
                },
                items: documentType.map((scale) {
                  return DropdownMenuItem(
                    value: scale,
                    child: Text(
                      scale,
                      style: TextStyle(color: AppColors.anchorGrey),
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Document type',
                  labelStyle: TextStyle(color: AppColors.anchorGrey),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Select Date'),
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.anchorGrey
                    ),
                  ),
                  Text(
                    '${dateFormat.format(selectedDate)}',
                    style: TextStyle(
                        color: AppColors.anchorGrey,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),

              Text(
                'Attachment',
                style: TextStyle(
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.attach_file, color: Colors.white, size: 15,), // Replace with the desired icon
                        SizedBox(width: 8), // Adjust the spacing between icon and text
                        Text('Attach file', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    onPressed: () {
                      _attachFile;
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.anchorGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),


                    ),

                  ),
                  ElevatedButton(
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.photo, color: Colors.white, size: 15,), // Replace with the desired icon
                        SizedBox(width: 8), // Adjust the spacing between icon and text
                        Text('Attach photo', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    onPressed: () {
                      _attachPhoto;
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.anchorGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),


                    ),
                  ),
                ],
              )



            ],
          ),
        ),
      ),
    );
  }
}
