import 'package:flutter/material.dart';
import 'package:health_hive/components/app_colors.dart';
import 'package:health_hive/components/app_text.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/temperatureform');
                },
                child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Temperature',
                      style: TextStyle(
                          fontSize: 14
                      ),
                    )
                ),
                style: ElevatedButton.styleFrom(
                    primary: AppColors.anchorGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20)
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/bloodpressureform');
                },
                child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Blood pressure',
                      style: TextStyle(
                          fontSize: 14
                      ),
                    )
                ),
                style: ElevatedButton.styleFrom(
                    primary: AppColors.anchorGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20)
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/bloodsugarform');
                },
                child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Blood sugar',
                      style: TextStyle(
                          fontSize: 14
                      ),
                    )
                ),
                style: ElevatedButton.styleFrom(
                    primary: AppColors.anchorGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20)
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/weightform');
                },
                child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Weight',
                      style: TextStyle(
                          fontSize: 14
                      ),
                    )
                ),
                style: ElevatedButton.styleFrom(
                    primary: AppColors.anchorGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20)
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/heightform');
                },
                child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Height',
                      style: TextStyle(
                          fontSize: 14
                      ),
                    )
                ),
                style: ElevatedButton.styleFrom(
                    primary: AppColors.anchorGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20)
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/hydrationform');
                },
                child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Hydration',
                      style: TextStyle(
                          fontSize: 14
                      ),
                    )
                ),
                style: ElevatedButton.styleFrom(
                    primary: AppColors.anchorGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20)
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/menstruationform');
                },
                child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Menstruation',
                      style: TextStyle(
                          fontSize: 14
                      ),
                    )
                ),
                style: ElevatedButton.styleFrom(
                    primary: AppColors.anchorGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
