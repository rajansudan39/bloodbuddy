import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext) {
//     return Scaffold(
//       body: Column(
//         children: [
//           CircleAvatar(
//             radius: 50,
//             child: Icon(
//               Icons.person,
//               size: 60,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Page",
        ),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Username: JohnDoe",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "Email: john.doe@example.com",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "Address: 123 Main St, City, Country",
                  style: TextStyle(fontSize: 18),
                ),
                // Add more user details here
              ],
            ),
          ),
        ],
      ),
    );
  }
}
