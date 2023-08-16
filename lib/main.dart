import 'package:flutter/material.dart';
import 'package:health_hive/components/app_colors.dart';
import 'package:health_hive/screens/authenticate/terms.dart';
import 'package:health_hive/screens/home/dashboard.dart';
import 'package:health_hive/screens/home/documents.dart';
import 'package:health_hive/screens/home/editprofile.dart';
import 'package:health_hive/screens/home/logbook.dart';
import 'package:health_hive/screens/home/logbook_options.dart';
import 'package:health_hive/screens/home/medication_form.dart';
import 'package:health_hive/screens/home/medications.dart';
import 'package:health_hive/screens/home/symptoms.dart';
import 'package:health_hive/screens/home/temperature_form.dart';
import 'package:health_hive/screens/wrapper.dart';
import 'package:health_hive/screens/authenticate/login.dart';
import 'package:health_hive/screens/authenticate/register.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType){
       return
         MaterialApp(
           debugShowCheckedModeBanner: false,
           routes: {
             '/': (context) => Wrapper(),
             '/login': (context) => Login(),
             '/register': (context) => Register(onSubmit: (String){},),
             '/terms': (context) => Terms(),
             '/dashboard': (context) => Dashboard(),
             '/editprofile': (context) => EditProfile(),
             '/symptoms': (context) => Symptoms(),
             '/medications': (context) => Medications(),
             '/documents': (context) => Documents(),
             '/logbook': (context) => Logbook(),
             '/logbookoptions': (context) => LogbookOptions(),
             '/medicationform': (context) => MedicationForm(),
             '/temperatureform': (context) => TemperatureForm()


           },


           initialRoute: '/',
         );
      }
    );
  }
}

