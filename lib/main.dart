import 'package:flutter/material.dart';
import 'package:health_hive/screens/authenticate/terms.dart';
import 'package:health_hive/screens/home/dashboard.dart';
import 'package:health_hive/screens/home/edit_medication_plan.dart';
import 'package:health_hive/screens/home/editprofile.dart';
import 'package:health_hive/screens/home/medication_plan.dart';
import 'package:health_hive/screens/wrapper.dart';
import 'package:health_hive/screens/authenticate/login.dart';
import 'package:health_hive/screens/authenticate/register.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Wrapper(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/terms': (context) => Terms(),
        '/dashboard': (context) => Dashboard(),
        '/editprofile': (context) => EditProfile(),
        '/medicationplan': (context) => MedicationPlan(),
        '/editmedicationplan': (context) => EditMedicationPlan()

      },
      initialRoute: '/',
    );
  }
}


