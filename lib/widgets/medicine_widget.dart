import 'package:flutter/material.dart';
import 'package:health_hive/models/medication_model.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/widgets/medicine_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MedicineWidget extends StatelessWidget {
  final String medication;
  final List<TimeOfDay> times;

  const MedicineWidget({Key? key, required this.medication, required this.times})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sort times in ascending order
    times.sort((a, b) => a.hour * 60 + a.minute - (b.hour * 60 + b.minute));

    return Card(
      elevation: 3,
      child: Column(
        children: [
          Column(
            children: times.map((time) {
              return ListTile(
                leading: Icon(
                  FontAwesomeIcons.pills,
                  size: 30,
                  color: AppColors.anchorGrey,
                ),
                title: Text(medication),
                subtitle: Text(
                  '${time.format(context).replaceAll(RegExp('[APMapm]'), '')}',
                  style: TextStyle(
                    color: AppColors.anchorGrey,
                    fontSize: 15,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
