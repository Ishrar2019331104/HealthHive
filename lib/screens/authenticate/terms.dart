import 'package:flutter/material.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/utils/app_text.dart';
class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: AppColors.anchorGrey
        ),
        title: AppText(
            text: 'Terms of use'
        ),
        backgroundColor: AppColors.slateGrey,
        elevation: 0,
      ),
      backgroundColor: AppColors.slateGrey,
      body: SingleChildScrollView(
        child: Container(
          padding:  EdgeInsets.fromLTRB(25, 11, 25, 116),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white
          ),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac justo nec magna fringilla consectetur. Sed auctor, mi a imperdiet mattis, mi lorem bibendum arcu, et consequat nulla risus ut leo. In fermentum orci eu nulla pharetra, sit amet ullamcorper odio volutpat. Nullam sagittis, odio non lacinia rhoncus, urna elit bibendum neque, ac rhoncus arcu nunc eu justo. Quisque posuere nisl at leo condimentum, nec dignissim ante tristique. Ut ultrices orci ac sapien pellentesque, id malesuada metus interdum. Pellentesque in metus sit amet orci pharetra faucibus. Nunc suscipit sem eu sagittis pharetra. Curabitur sollicitudin, sapien nec varius pellentesque, nunc elit luctus lorem, eu scelerisque quam tellus sed massa. Aenean tincidunt quam vitae velit cursus, in dictum nunc consectetur. Vivamus ac justo a enim euismod consequat vel at ipsum. Donec suscipit augue in fermentum tempus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi et orci dui. Nullam a mauris a velit tincidunt faucibus id nec libero. Sed varius nisl eu arcu dictum euismod. Proin eget tortor sit amet nulla tincidunt blandit. Aenean vestibulum, nisi eu fermentum venenatis, augue dolor congue metus, non accumsan neque justo vel arcu. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec varius sagittis justo nec bibendum. Sed congue metus et scelerisque. Nunc euismod pharetra lacinia. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut at pellentesque ante. Nullam rhoncus, ipsum a aliquam hendrerit, tortor orci varius elit, nec facilisis sapien mauris a ex. Duis vel arcu sit amet nisl ultrices congue at at ante. Vivamus non erat eget elit auctor posuere. Nam facilisis, ante et eleifend sollicitudin, nunc elit fermentum ex, et volutpat augue risus a dui. In eleifend justo a laoreet viverra. Aliquam vestibulum, ex nec blandit placerat, justo neque elementum urna, non aliquam velit odio non velit. Integer eget turpis semper, pharetra tortor non, maximus metus. Nullam ullamcorper, neque at feugiat hendrerit, est risus hendrerit erat, a blandit justo purus ut libero. Nam nec justo ligula. Integer eu mi lectus. Nullam blandit, quam sit amet eleifend gravida, ipsum mi laoreet libero, vel sollicitudin dui mi at felis. Integer auctor laoreet metus, nec varius odio congue eget. Aliquam nec leo felis. Vestibulum at metus vel elit volutpat lacinia. Quisque eu felis at quam iaculis volutpat. Proin suscipit arcu id suscipit fermentum. Sed dapibus libero non elit rhoncus hendrerit. Aenean consectetur feugiat bibendum. Nulla facilisi. Fusce id gravida nisi, sed vehicula sapien. In mattis malesuada suscipit. Fusce vehicula ex ac quam feugiat, sit amet venenatis eros cursus. Ut euismod facilisis dolor et congue. Fusce bibendum vel erat a luctus.'
          ),

        ),
      ),
    );
  }
}
