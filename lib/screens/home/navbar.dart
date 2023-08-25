import 'package:flutter/material.dart';
import 'package:health_hive/screens/home/share_documents.dart';
import 'package:health_hive/utils/app_colors.dart';
import 'package:health_hive/utils/app_text.dart';



class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override


  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _oldPasswordController = TextEditingController();




  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
           SizedBox(
             height: 400,
             child: DrawerHeader(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 50, 10, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                        Icons.person_rounded,
                      color: AppColors.anchorGrey,
                      size: 60,
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    AppText(text: 'Ishrar Chowdhury'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        'PIN: 120202242',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.anchorGrey
                      ),
                    )

                  ],
                ),
              )
          ),
           ),
          ListTile(
            leading: Icon(Icons.share_rounded, color: AppColors.anchorGrey),
            title: Text(
              'Share records',
              style: TextStyle(
                  color: AppColors.anchorGrey
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/sharedocuments');
            },
          ),
          ListTile(
            leading: Icon(Icons.lock, color: AppColors.anchorGrey),
            title:  Text(
              'Change password',
              style: TextStyle(
                  color: AppColors.anchorGrey
              ),
            ),
            onTap: () {
              _openDialog();
            },
          ),
          ListTile(
            leading: Icon(Icons.delete, color: AppColors.anchorGrey),
            title: Text(
              'Delete profile',
              style: TextStyle(
                  color: AppColors.anchorGrey
              ),
            ),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(Icons.edit, color: AppColors.anchorGrey),
            title: Text(
              'Edit profile',
              style: TextStyle(
                  color: AppColors.anchorGrey
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/editprofile');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout,  color: AppColors.anchorGrey),
            title: Text(
              'Logout',
              style: TextStyle(
                  color: AppColors.anchorGrey
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),

        ],
      )

    );
  }
  Future _openDialog() async { await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      title: Text(
          'Change password',
        style: TextStyle(
          color: AppColors.anchorGrey
        ),
      ),
      content: Column(
        children: [
          TextField(
            autofocus: true,
            controller: _oldPasswordController,
            decoration: InputDecoration(
              labelText: 'Old password',
              labelStyle:  TextStyle(
                color: AppColors.anchorGrey
            ),


            ),
          ),
          TextField(
            controller: _newPasswordController,

            decoration: InputDecoration(
              labelText: 'New password',
              labelStyle:  TextStyle(
                  color: AppColors.anchorGrey
              ),


            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text(
              'OK',
            style: TextStyle(
              color: AppColors.anchorGrey
            ),
          ),
          onPressed: (){



          },
        )
      ],
    )
  );
  }

}


