import 'package:flutter/material.dart';
import 'package:health_hive/models/medication_model.dart';
import 'package:health_hive/providers/medication_provider.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/widgets/medicine_widget.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../../utils/app_text.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import for displaying SVG images

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
    return Consumer<MedicationProvider>(
      builder: (context, medicationProviderModel, child) {
        List<MedicationEntry> medicationEntries =
        medicationProviderModel.getMedicationEntriesForDate(today);

        return Scaffold(
          backgroundColor: AppColors.slateGrey,
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
              children: <Widget>[
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
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Medications for ${DateFormat('MMMM d, y').format(today)}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.anchorGrey
                    ),
                  ),
                ),
                Expanded(
                  child:medicationEntries.isEmpty
                      ? Center(
                    // Show SVG image when medication list is empty
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/empty.svg', // Replace with your SVG asset path
                          width: 150,
                          height: 150,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text('No medications for today')
                      ],
                    )
                  ) :  ListView.builder(
                    itemCount: medicationEntries.length,
                    itemBuilder: (context, index) {
                      MedicationEntry entry = medicationEntries[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          for (var medication in entry.medications)
                              MedicineWidget(
                                medication: medication,
                                times: entry.times,
                              )
                        ],
                      );
                    },
                  ),
                ),

              ],
            )
        );
      }
    );
  }
}
