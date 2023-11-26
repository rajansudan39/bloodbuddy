import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        //
      ),
      body: SafeArea(
        child: ListView(padding: EdgeInsets.all(24), children: [
          ListTile(
            title: Text('Account Settings'),
            leading: Icon(Icons.account_circle),
            onTap: () {
              // logic
            },
          ),
          Divider(),
          ListTile(
            title: Text('Security and Privacy'),
            leading: Icon(Icons.security),
            onTap: () {
              //logic
            },
          ),
          Divider(),
          ListTile(
            title: Text('Notifications Settings'),
            leading: Icon(Icons.notifications),
            onTap: () {
              //logic
            },
          ),
          Divider(),
          ListTile(
            title: Text('Help and Support'),
            leading: Icon(Icons.help),
            onTap: () {
              //logic
            },
          ),
          Divider(),
          ListTile(
              title: Text("Delete Account"),
              leading: Icon(Icons.delete),
              onTap: () {
                //logic
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Confirm Deletion"),
                        content: Text(
                            'Are you sure you want to delete your account?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              //add logic to delete account permanently
                              Navigator.of(context).pop();
                            },
                            child: Text("Delete"),
                          ),
                        ],
                      );
                    });
              })
        ]),
      ),
    );
  }
}
