import 'package:flutter/material.dart';
import 'package:health_hive/models/medication_model.dart';
import 'package:health_hive/providers/medication_provider.dart';
import 'package:health_hive/providers/user_provider.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/utils/app_text.dart';
import 'package:health_hive/widgets/medicine_card.dart';
import 'package:health_hive/screens/home/documents.dart';
import 'package:health_hive/screens/home/logbook.dart';
import 'package:health_hive/screens/home/medications.dart';
import 'package:health_hive/screens/home/navbar.dart';
import 'package:health_hive/screens/home/symptoms.dart';
import 'package:provider/provider.dart';

import '../../widgets/medicine_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    // data = ModalRoute.of(context)?.settings.arguments as String?;

    return Consumer2<UserProvider, MedicationProvider>(
        builder: (context, userProviderModel, medicationProviderModel, child )  {
          final today = DateTime.now();
          List <MedicationEntry> medicationsForToday = medicationProviderModel.getMedicationEntriesForDate(today);
          print(medicationsForToday.length);
          return Scaffold(
          // sliding menu
          backgroundColor: AppColors.slateGrey,
          drawer: NavBar(),
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: AppColors.anchorGrey,
            ),
            // username
            title: AppText(text: 'Hello ${userProviderModel.userName}'),
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
                  "Medications to take today",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.anchorGrey
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: medicationsForToday.length,
                  itemBuilder: (context, index) {
                    MedicationEntry entry = medicationsForToday[index];
                    return Column(
                      children: [
                        Column(
                          children: entry.medications.map((medication) {
                            return MedicineWidget(
                              medication: medication,
                              times: entry.times,
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  },
                ),
              ),

            ],
          ),

          bottomNavigationBar: BottomNavigationBar(

            onTap: (index){
              setState(() {
                  _selectedIndex = index;
                  if(_selectedIndex==0){
                    Navigator.pushNamed(context, '/symptoms');
                  }
                  else if(_selectedIndex==1){
                    Navigator.pushNamed(context, '/medications');
                  }
                  else if(_selectedIndex==2){
                    Navigator.pushNamed(context, '/documents');
                  }
                  else if(_selectedIndex==3){
                    Navigator.pushNamed(context, '/logbook');
                  }
              });
            } ,
            currentIndex: _selectedIndex,
            backgroundColor: AppColors.anchorGrey,
            selectedItemColor: Colors.white,
            unselectedItemColor: AppColors.slateGrey,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
            type: BottomNavigationBarType.fixed,

            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: 'Symptoms',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.medical_services),
                label: 'Medications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.document_scanner),
                label: 'Documents',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Logbook',
              ),
            ],
          ),
        );}
      );

  }
}
