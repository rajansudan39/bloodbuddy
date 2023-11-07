import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_list_title.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOut;
  MyDrawer({
    super.key,
    required this.onProfileTap,
    required this.onSignOut,
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

              //home list title

              //profile list title
              MyListTile(
                icon: Icons.person,
                text: 'P R O F I L E',
                onTap: onProfileTap,
              ),

              MyListTile(
                icon: Icons.info,
                text: "A B O U T  US",
                onTap: () => Navigator.pop(context),
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
