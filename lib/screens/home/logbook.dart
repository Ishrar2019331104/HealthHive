import 'package:flutter/material.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/utils/app_text.dart';
import 'package:health_hive/widgets/temperature_card.dart';
import 'package:health_hive/widgets/temperature_widget.dart';
class Logbook extends StatefulWidget {
  const Logbook({Key? key}) : super(key: key);

  @override
  State<Logbook> createState() => _LogbookState();
}

class _LogbookState extends State<Logbook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.slateGrey,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.anchorGrey,
        ),
        // username
        title: AppText(text: 'Logbook'),
        backgroundColor: AppColors.slateGrey,
        elevation: 0,
        // add medication
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/logbookoptions');
            },
            icon: Icon(
              Icons.add_box_rounded,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Logbook entries for today",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.anchorGrey
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: TemperatureModel.temp_card.length,
              itemBuilder: (context, index) {
                return TemperatureWidget(temperature: TemperatureModel.temp_card[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
