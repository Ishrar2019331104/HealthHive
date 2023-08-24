import 'package:flutter/material.dart';
import 'package:health_hive/models/logbook_model.dart';
import 'package:health_hive/providers/logbook_provider.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LogbookWidget extends StatelessWidget {


  final LogbookEntry logbookEntry;
  const LogbookWidget({Key? key, required this.logbookEntry}) : super(key: key);


  @override



  Widget build(BuildContext context) {

    final isTemperatureCategory = logbookEntry.category == 'temperature';
    final isBloodPressureCategory = logbookEntry.category == 'bloodpressure';
    final isBloodSugarCategory = logbookEntry.category == 'bloodsugar';

    return Consumer<LogbookProvider>(
      builder: (context, logbookProviderModel, child) => Card(
        elevation: 3,
        child: ListTile(

          leading: _buildLeadingIcon(context),
          title: _buildTitleText(context),

          subtitle: Text('${DateFormat('MMMM d, yyyy').format(logbookEntry.selectedDate)} ${logbookEntry.selectedTime.format(context)}'),


        ),
      ),
    );
  }

  Widget _buildLeadingIcon(BuildContext context) {
    if(logbookEntry.category=='temperature'){
     return Icon(
        Icons.thermostat,
        color: Colors.blue,
      );
    } else if(logbookEntry.category=='bloodsugar'){
      return Icon(
        FontAwesomeIcons.flask,
        color: Colors.green,
      );
    } else if(logbookEntry.category=='weight'){
      return Icon(
        FontAwesomeIcons.weight,
        color: Colors.orange,
      );
    } else if(logbookEntry.category=='height'){
      return Icon(
        FontAwesomeIcons.ruler,
        color: Colors.purple,
      );
    } else if(logbookEntry.category=='hydration'){
      return Icon(
        FontAwesomeIcons.glassWater,
        color: Colors.teal,
      );
    } else if(logbookEntry.category=='menstruation'){
      return Icon(
        FontAwesomeIcons.tint,
        color: Colors.red,
      );
    } else {
      return Icon(
        Icons.favorite,
        color: Colors.yellow,
      );
    }
  }

  Widget _buildTitleText(BuildContext context){
    if(logbookEntry.category=='temperature') {
      return Text('${logbookEntry.entryValue} °${logbookEntry.entryDataType[0]}');
    } else if (logbookEntry.category == 'menstruation') {
      final entryValue = logbookEntry.entryValue; // Assuming entryValue is a String

      // Split the entryValue into flow, color, and consistency
      final parts = entryValue.replaceAll('(', '').replaceAll(')', '').split(',');

      if (parts.length == 3) {
        final flow = parts[0].trim();
        final color = parts[1].trim();
        final consistency = parts[2].trim();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Flow: $flow'),
            SizedBox(height: 4),
            Text('Color: $color'),
            SizedBox(height: 4),
            Text('Consistency: $consistency'),
            SizedBox(height: 4),
          ],
        );
      } else {
        return Text('Invalid entry format'); // Handle incorrect entry format
      }
    }
    else {
      return Text('${logbookEntry.entryValue} ${logbookEntry.entryDataType}');
    }

  }
}

