import 'package:flutter/material.dart';
import 'package:health_hive/components/app_colors.dart';
import 'package:health_hive/components/app_text.dart';
class AppCard extends StatefulWidget {
  final Widget content;
  final String medTime;
  const AppCard({Key? key, required this.content, required this.medTime}) : super(key: key);

  @override
  State<AppCard> createState() => _AppCardState();

}

class _AppCardState extends State<AppCard> {
  @override


  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 250,
      width: 500,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)
        ),

        elevation: 4,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                          widget.medTime,
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      IconButton(

                        // pop up to take medication

                        onPressed: () {},
                        icon: Icon(
                            Icons.more_horiz,
                          size: 30,
                          color: AppColors.slateGrey,
                        ),
                      ),
                    ],
                  ),
                ),

                decoration: BoxDecoration(
                    color: AppColors.anchorGrey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  )
                ),

              ),

              widget.content



            ],
          ),
        ),

      ),
    );
  }
}
