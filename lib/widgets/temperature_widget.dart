import 'package:flutter/material.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/widgets/temperature_card.dart';

class TemperatureWidget extends StatelessWidget {
  final Temperature temperature;
  const TemperatureWidget({Key? key, required this.temperature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(

          leading: Icon(
            Icons.thermostat,
            color: AppColors.anchorGrey,
          ),
          title: Text('${temperature.temperature.toString()} °${temperature.scale}'),

          subtitle: Text('${temperature.time}'),
          trailing: IconButton(
            icon: Icon(Icons.arrow_right),
            onPressed: (){},
          )

      ),
    );
  }
}
