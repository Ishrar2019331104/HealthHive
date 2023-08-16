import 'package:flutter/material.dart';
import 'package:health_hive/components/app_colors.dart';
import 'package:health_hive/components/medicine_card.dart';

class MedicineWidget extends StatelessWidget {

  final Medicine medicine;

  const MedicineWidget({Key? key, required this.medicine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(

        leading: Icon(
            Icons.medication,
          color: AppColors.anchorGrey,
        ),
        title: Text(medicine.name),
          subtitle: Text('${medicine.time} | ${medicine.status}'),
        trailing: IconButton(
          icon: Icon(Icons.arrow_right),
          onPressed: (){},
        )

      ),
    );
  }
}
