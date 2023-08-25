import 'package:flutter/material.dart';
import 'package:health_hive/providers/symptom_provider.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/utils/app_text.dart';
import 'package:health_hive/widgets/symptom_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_hive/screens/home/dashboard.dart';

class Symptoms extends StatefulWidget {
  const Symptoms({Key? key}) : super(key: key);

  @override
  State<Symptoms> createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {

  bool _showCheckboxes = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<SymptomProvider>(
      builder: (context, symptomProviderModel, child)  {
        // symptomProviderModel.symptoms.sort((a, b) => b.selectedDate.compareTo(a.selectedDate));
        return Scaffold(
        backgroundColor: AppColors.slateGrey,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.anchorGrey,
          ),
          // username
          title: AppText(text: 'Symptoms'),
          backgroundColor: AppColors.slateGrey,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: AppColors.anchorGrey,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                      (Route<dynamic> route) => false,
                ); // Navigate back to Dashboard
              }
          ),
          elevation: 0,
          // add medication
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/symptomform');
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
                "Symptoms",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.anchorGrey
                ),
              ),
            ),
            symptomProviderModel.symptoms.isEmpty ? Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SvgPicture.asset(
                      'assets/empty.svg',
                      width: 180,
                      height: 180,

                    ),
                    SizedBox(
                        height: 50
                    ),
                    Text(
                        'No symptoms found!',
                        style: TextStyle(
                            color: AppColors.anchorGrey,
                            fontSize: 16
                        )
                    )
                  ],
                ),
              ),
            ) : Expanded(
              child: ListView.builder(
                itemCount: symptomProviderModel.symptoms.length,
                itemBuilder: (context, index) {
                  return SymptomWidget(symptom: symptomProviderModel.symptoms[index]);
                },
              ),
            ),
          ],
        ),
      );
        },
    );
  }
}
