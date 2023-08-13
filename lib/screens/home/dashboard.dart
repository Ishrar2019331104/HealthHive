import 'package:flutter/material.dart';
import 'package:health_hive/components/app_card.dart';
import 'package:health_hive/components/app_colors.dart';
import 'package:health_hive/components/app_text.dart';
import 'package:health_hive/screens/authenticate/login.dart';
import 'package:health_hive/screens/home/medication_plan.dart';
import 'package:health_hive/screens/home/navbar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String username = 'Ishrar Chowdhury';

  List <String> medList = ['paracetamol', 'ace', 'avil'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // sliding menu
      drawer: NavBar(),


      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.anchorGrey
        ),

          // username
        title: AppText(text: 'Hello, $username'),
        backgroundColor: AppColors.slateGrey,
        elevation: 0,


        // add medication
        actions: <Widget> [
          IconButton(
            onPressed: (){},
            icon: Icon(
                Icons.add_box_rounded,
              size: 30,
            )
          )
        ]
      ),
      backgroundColor: AppColors.slateGrey,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Medications to take',
                style: TextStyle(
                  color: AppColors.anchorGrey,
                  fontWeight: FontWeight.w600
                ),
              ),
              AppCard(
                medTime: medList.isEmpty ? "": "16:40",
                content: medList.isEmpty ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'No medication to show',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.anchorGrey
                    ),
                  ),
                ) : Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '${medList[0]}',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: AppColors.anchorGrey
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Take 1 tablet',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.anchorGrey
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              onPressed: (){
                                 Navigator.pushNamed(context, '/medicationplan');
                              },
                              child: Text(
                                  'See all medication plan',
                                style: TextStyle(
                                  color: AppColors.anchorGrey
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 10
              ),

              Text(
                'Medications intake (last 7 days)',
                style: TextStyle(
                    color: AppColors.anchorGrey,
                    fontWeight: FontWeight.w600
                ),
              ),

              AppCard(
                medTime: medList.isEmpty ? "": "16:40",
                content: medList.isEmpty ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'No medication intake in the last 7 days',
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.anchorGrey
                    ),
                  ),
                ) : Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '${medList[0]}',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: AppColors.anchorGrey
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Take 1 tablet',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.anchorGrey
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              onPressed: (){},
                              child: Text(
                                'See all medication plan',
                                style: TextStyle(
                                    color: AppColors.anchorGrey
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
