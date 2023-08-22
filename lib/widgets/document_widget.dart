import 'package:health_hive/widgets/document_card.dart';
import 'package:flutter/material.dart';
import 'package:health_hive/utils/app_colors.dart';

class DocumentWidget extends StatelessWidget {

  final Document document;
  const DocumentWidget({Key? key, required this.document}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 3,
      child: ListTile(

          leading: Icon(
            Icons.attachment,
            color: AppColors.anchorGrey,
          ),
          title: Text('${document.document_title}'),

          subtitle: Text('${document.document_type} ${document.date}'),
          trailing: IconButton(
            icon: Icon(Icons.arrow_right),
            onPressed: (){},
          )

      ),
    );
  }
}
