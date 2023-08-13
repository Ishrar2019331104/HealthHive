import 'package:flutter/material.dart';
import 'package:health_hive/components/app_colors.dart';
import 'package:health_hive/components/app_text.dart';


class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
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
                    CircleAvatar(
                      backgroundColor: Colors.grey[400],
                      radius: 60,
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
            leading: Icon(Icons.lock, color: AppColors.anchorGrey),
            title:  Text(
              'Change password',
              style: TextStyle(
                  color: AppColors.anchorGrey
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.delete, color: AppColors.anchorGrey),
            title: Text(
              'Delete profile',
              style: TextStyle(
                  color: AppColors.anchorGrey
              ),
            ),
            onTap: () {},
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
}

