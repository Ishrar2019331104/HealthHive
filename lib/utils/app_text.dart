import 'package:flutter/material.dart';
import 'package:health_hive/utils/app_colors.dart';

class AppText extends StatelessWidget {


  final String text;

  // constructor
  AppText({required this.text});



  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.anchorGrey,
          fontSize: 20,
          fontWeight: FontWeight.w700
      ),
    );
  }
}
