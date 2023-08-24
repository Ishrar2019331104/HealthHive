import 'package:flutter/material.dart';
import 'package:health_hive/providers/document_provider.dart';
import 'package:health_hive/providers/symptom_provider.dart';
import 'package:health_hive/providers/user_provider.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/screens/authenticate/terms.dart';
import 'package:health_hive/screens/home/bloodpressure_form.dart';
import 'package:health_hive/screens/home/bloodsugar_form.dart';
import 'package:health_hive/screens/home/dashboard.dart';
import 'package:health_hive/screens/home/documents.dart';
import 'package:health_hive/screens/home/editprofile.dart';
import 'package:health_hive/screens/home/height_form.dart';
import 'package:health_hive/screens/home/hydration_form.dart';
import 'package:health_hive/screens/home/logbook.dart';
import 'package:health_hive/screens/home/logbook_options.dart';
import 'package:health_hive/screens/home/medication_form.dart';
import 'package:health_hive/screens/home/medications.dart';
import 'package:health_hive/screens/home/menstruation_form.dart';
import 'package:health_hive/screens/home/symptom_form.dart';
import 'package:health_hive/screens/home/symptoms.dart';
import 'package:health_hive/screens/home/temperature_form.dart';
import 'package:health_hive/screens/home/weight_form.dart';
import 'package:health_hive/screens/wrapper.dart';
import 'package:health_hive/screens/authenticate/login.dart';
import 'package:health_hive/screens/authenticate/register.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'providers/logbook_provider.dart';
import 'screens/home/document_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SymptomProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DocumentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LogbookProvider(),
        ),


      ],
      child: Sizer(
        builder: (context, orientation, deviceType){
         return
           MaterialApp(
             debugShowCheckedModeBanner: false,
             routes: {
               '/': (context) => Wrapper(),
               '/login': (context) => Login(),
               '/register': (context) => Register(),
               '/terms': (context) => Terms(),
               '/dashboard': (context) => Dashboard(),
               '/editprofile': (context) => EditProfile(),
               '/symptoms': (context) => Symptoms(),
               '/medications': (context) => Medications(),
               '/documents': (context) => Documents(),
               '/logbook': (context) => Logbook(),
               '/logbookoptions': (context) => LogbookOptions(),
               '/medicationform': (context) => MedicationForm(),
               '/temperatureform': (context) => TemperatureForm(),
               '/bloodpressureform': (context) => BloodPressureForm(),
               '/bloodsugarform': (context) => BloodSugarForm(),
               '/heightform': (context) => HeightForm(),
               '/weightform': (context) => WeightForm(),
               '/hydrationform': (context) => HydrationForm(),
               '/menstruationform': (context) => MenstruationForm(),
               '/symptomform': (context) => SymptomForm(),
               '/documentform': (context) => DocumentForm()



             },


             initialRoute: '/',
           );
        }
      ),
    );
  }
}

