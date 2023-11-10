import 'package:flutter/material.dart';
import 'package:bloodbuddy/components/my_list_title.dart';
import 'package:bloodbuddy/pages/about_us.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOut;
  final void Function()? onSettingsTap;

  MyDrawer({
    super.key,
    required this.onProfileTap,
    required this.onSignOut,
    required this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepPurple[200],
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //header
              const DrawerHeader(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 64,
                ),
              ),

              //profile list title
              MyListTile(
                icon: Icons.person,
                text: 'P R O F I L E',
                onTap: onProfileTap,
              ),

              MyListTile(
                icon: Icons.info,
                text: "A B O U T  US",
                onTap: () {
                  Navigator.of(context).pop();

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AboutUs(),
                    ),
                  );
                },
              ),
              //settings
              MyListTile(
                icon: Icons.settings,
                text: ' S E T T I N G S',
                onTap: onSettingsTap,
              ),
            ],
          ),

          //logout
          MyListTile(
            icon: Icons.logout,
            text: '  L O G O U T',
            onTap: onSignOut,
          ),
        ],
      ),
    );
  }
}
