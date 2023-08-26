import 'package:flutter/material.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/utils/app_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class LogbookOptions extends StatelessWidget {
  const LogbookOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.anchorGrey,
        ),
        // username
        title: AppText(text: 'Logbook'),
        backgroundColor: AppColors.slateGrey,
        elevation: 0,
        // add medication


      ),
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.all(20.0),
      //     child: Column(
      //       children: <Widget>[
      //         ElevatedButton(
      //           onPressed: (){
      //             Navigator.pushNamed(context, '/temperatureform');
      //           },
      //           child: Container(
      //               width: double.infinity,
      //               alignment: Alignment.center,
      //               child: Text(
      //                 'Temperature',
      //                 style: TextStyle(
      //                     fontSize: 14
      //                 ),
      //               )
      //           ),
      //           style: ElevatedButton.styleFrom(
      //               primary: AppColors.anchorGrey,
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(50)
      //               ),
      //               padding: EdgeInsets.fromLTRB(0, 20, 0, 20)
      //           ),
      //         ),
      //         SizedBox(
      //           height: 16,
      //         ),
      //         ElevatedButton(
      //           onPressed: (){
      //             Navigator.pushNamed(context, '/bloodpressureform');
      //           },
      //           child: Container(
      //               width: double.infinity,
      //               alignment: Alignment.center,
      //               child: Text(
      //                 'Blood pressure',
      //                 style: TextStyle(
      //                     fontSize: 14
      //                 ),
      //               )
      //           ),
      //           style: ElevatedButton.styleFrom(
      //               primary: AppColors.anchorGrey,
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(50)
      //               ),
      //               padding: EdgeInsets.fromLTRB(0, 20, 0, 20)
      //           ),
      //         ),
      //         SizedBox(
      //           height: 16,
      //         ),
      //         ElevatedButton(
      //           onPressed: (){
      //             Navigator.pushNamed(context, '/bloodsugarform');
      //           },
      //           child: Container(
      //               width: double.infinity,
      //               alignment: Alignment.center,
      //               child: Text(
      //                 'Blood sugar',
      //                 style: TextStyle(
      //                     fontSize: 14
      //                 ),
      //               )
      //           ),
      //           style: ElevatedButton.styleFrom(
      //               primary: AppColors.anchorGrey,
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(50)
      //               ),
      //               padding: EdgeInsets.fromLTRB(0, 20, 0, 20)
      //           ),
      //         ),
      //         SizedBox(
      //           height: 16,
      //         ),
      //         ElevatedButton(
      //           onPressed: (){
      //             Navigator.pushNamed(context, '/weightform');
      //           },
      //           child: Container(
      //               width: double.infinity,
      //               alignment: Alignment.center,
      //               child: Text(
      //                 'Weight',
      //                 style: TextStyle(
      //                     fontSize: 14
      //                 ),
      //               )
      //           ),
      //           style: ElevatedButton.styleFrom(
      //               primary: AppColors.anchorGrey,
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(50)
      //               ),
      //               padding: EdgeInsets.fromLTRB(0, 20, 0, 20)
      //           ),
      //         ),
      //         SizedBox(
      //           height: 16,
      //         ),
      //         ElevatedButton(
      //           onPressed: (){
      //             Navigator.pushNamed(context, '/heightform');
      //           },
      //           child: Container(
      //               width: double.infinity,
      //               alignment: Alignment.center,
      //               child: Text(
      //                 'Height',
      //                 style: TextStyle(
      //                     fontSize: 14
      //                 ),
      //               )
      //           ),
      //           style: ElevatedButton.styleFrom(
      //               primary: AppColors.anchorGrey,
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(50)
      //               ),
      //               padding: EdgeInsets.fromLTRB(0, 20, 0, 20)
      //           ),
      //         ),
      //         SizedBox(
      //           height: 16,
      //         ),
      //         ElevatedButton(
      //           onPressed: (){
      //             Navigator.pushNamed(context, '/hydrationform');
      //           },
      //           child: Container(
      //               width: double.infinity,
      //               alignment: Alignment.center,
      //               child: Text(
      //                 'Hydration',
      //                 style: TextStyle(
      //                     fontSize: 14
      //                 ),
      //               )
      //           ),
      //           style: ElevatedButton.styleFrom(
      //               primary: AppColors.anchorGrey,
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(50)
      //               ),
      //               padding: EdgeInsets.fromLTRB(0, 20, 0, 20)
      //           ),
      //         ),
      //         SizedBox(
      //           height: 16,
      //         ),
      //         ElevatedButton(
      //           onPressed: (){
      //             Navigator.pushNamed(context, '/menstruationform');
      //           },
      //           child: Container(
      //               width: double.infinity,
      //               alignment: Alignment.center,
      //               child: Text(
      //                 'Menstruation',
      //                 style: TextStyle(
      //                     fontSize: 14
      //                 ),
      //               )
      //           ),
      //           style: ElevatedButton.styleFrom(
      //               primary: AppColors.anchorGrey,
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(50)
      //               ),
      //               padding: EdgeInsets.fromLTRB(0, 20, 0, 20)
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      backgroundColor: AppColors.slateGrey,
      body: GridView.count(


        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.anchorGrey
            ),
            padding: EdgeInsets.all(16),


            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                   IconButton(
                     onPressed: (){
                       Navigator.pushNamed(context, '/temperatureform');
                     },
                     iconSize: 50,
                     icon: Icon(Icons.thermostat),
                     color: AppColors.slateGrey,
                   ),

                   Text(
                       'Temperature',
                     style: TextStyle(
                       color: AppColors.slateGrey,
                       fontSize: 18
                     ),
                   ),
                ],
              ),
            ),
          ),
          Container(


            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.anchorGrey
            ),
            padding: EdgeInsets.all(16),


            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  IconButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/bloodpressureform');
                    },
                    iconSize: 50,
                    icon: FaIcon(FontAwesomeIcons.stethoscope),
                    color: AppColors.slateGrey,
                  ),

                  Text(
                    'Blood pressure',
                    style: TextStyle(
                        color: AppColors.slateGrey,
                        fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.anchorGrey
            ),
            padding: EdgeInsets.all(16),


            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  IconButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/bloodsugarform');
                    },
                    iconSize: 50,
                    icon: FaIcon(FontAwesomeIcons.medkit),
                    color: AppColors.slateGrey,
                  ),

                  Text(
                    'Blood sugar',
                    style: TextStyle(
                        color: AppColors.slateGrey,
                        fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.anchorGrey
            ),
            padding: EdgeInsets.all(16),


            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  IconButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/weightform');
                    },
                    iconSize: 50,
                    icon: FaIcon(FontAwesomeIcons.weightScale),
                    color: AppColors.slateGrey,
                  ),

                  Text(
                    'Weight',
                    style: TextStyle(
                        color: AppColors.slateGrey,
                        fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.anchorGrey
            ),
            padding: EdgeInsets.all(16),


            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  IconButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/heightform');
                    },
                    iconSize: 50,
                    icon: FaIcon(FontAwesomeIcons.personArrowUpFromLine),
                    color: AppColors.slateGrey,
                  ),

                  Text(
                    'Height',
                    style: TextStyle(
                        color: AppColors.slateGrey,
                        fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.anchorGrey
            ),
            padding: EdgeInsets.all(16),


            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  IconButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/hydrationform');
                    },
                    iconSize: 50,
                    icon: FaIcon(FontAwesomeIcons.bottleWater),
                    color: AppColors.slateGrey,
                  ),

                  Text(
                    'Hydration',
                    style: TextStyle(
                        color: AppColors.slateGrey,
                        fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.anchorGrey
            ),
            padding: EdgeInsets.all(16),


            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  IconButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/menstruationform');
                    },
                    iconSize: 50,
                    icon: FaIcon(FontAwesomeIcons.droplet),
                    color: AppColors.slateGrey,
                  ),

                  Text(
                    'Menstruation',
                    style: TextStyle(
                        color: AppColors.slateGrey,
                        fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
