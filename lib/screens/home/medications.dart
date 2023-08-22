import 'package:flutter/material.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/widgets/medicine_card.dart';
import 'package:health_hive/widgets/medicine_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_text.dart';
class Medications extends StatefulWidget {
  const Medications({Key? key}) : super(key: key);

  @override
  State<Medications> createState() => _MedicationsState();
}

class _MedicationsState extends State<Medications> {
  @override

  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today = day;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.anchorGrey,
        ),
        // username
        title: AppText(text: 'Medications'),
        backgroundColor: AppColors.slateGrey,
        elevation: 0,
        // add medication
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/medicationform');
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
        children:  <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Medications",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.anchorGrey
              ),
            ),
          ),
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: today,
          locale: "en_US",
          rowHeight: 42,
          selectedDayPredicate: (day) => isSameDay(day, today),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          availableGestures: AvailableGestures.all,
          onDaySelected: _onDaySelected,
          calendarFormat: CalendarFormat.week,
          calendarStyle: CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: AppColors.anchorGrey,
              shape: BoxShape.circle
            )

          ),

        ),
          Expanded(
            child: ListView.builder(
              itemCount: MedicineModel.meds.length,
              itemBuilder: (context, index) {
                return MedicineWidget(medicine: MedicineModel.meds[index]);
              },
            ),
          ),

        ],
      )
    );
  }
}
