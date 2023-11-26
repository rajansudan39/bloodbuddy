import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        // title: const Text('About Us'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text(
            'About Us',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'We are a group of students from VIIT who are passionate about helping people in need. We have created this platform to help people who are in need of help and people who are willing to help.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Contact Us',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text(
              'rajansudan6@gmail.com',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            //ontap to be added
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text(
              '+91 8494072872',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
