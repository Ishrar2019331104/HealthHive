import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:health_hive/providers/logbook_provider.dart';
import 'package:health_hive/screens/home/dashboard.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/utils/app_text.dart';
import 'package:health_hive/widgets/logbook_widget.dart';
import 'package:provider/provider.dart';
class Logbook extends StatefulWidget {
  const Logbook({Key? key}) : super(key: key);

  @override
  State<Logbook> createState() => _LogbookState();
}

class _LogbookState extends State<Logbook> {





  @override
  Widget build(BuildContext context) {
    return Consumer<LogbookProvider>(
      builder: (context, logbookProviderModel, child) => Scaffold(
        backgroundColor: AppColors.slateGrey,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.anchorGrey,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
                    (Route<dynamic> route) => false,
              );
            },
          ),
          title: AppText(text: 'Logbook'),
          backgroundColor: AppColors.slateGrey,
          elevation: 0,

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
                "Logbook entries",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.anchorGrey
                ),
              ),
            ),
            logbookProviderModel.logbookentries.isEmpty ? Expanded(
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
                        'No logbook records found!',
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
                itemCount: logbookProviderModel.logbookentries.length,
                itemBuilder: (context, index) {
                  final entry = logbookProviderModel.logbookentries[index];
                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction){
                      if (direction == DismissDirection.endToStart) {
                        // Delete the document from the provider
                        setState(() {
                          logbookProviderModel.removeEntry(index);
                        });

                        // Show a snackbar to indicate that the document has been deleted
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text('Entry deleted'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Add the document back to the list if user wants to undo
                                logbookProviderModel.addEntry(index, entry);
                              },
                            ),
                          ),
                        );
                      }
                    },

                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    child: LogbookWidget(logbookEntry: entry),

                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

