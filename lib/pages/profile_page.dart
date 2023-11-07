import 'package:csc_picker/csc_picker.dart';
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

class UserData {
  String name;
  String email;
  String phone;
  String address;
  String city;
  String state;
  String gender;
  String bloodGroup;
  DateTime? dob;

  UserData({
    this.name = "",
    this.email = "",
    this.phone = "",
    this.address = "",
    this.city = "",
    this.state = "",
    this.gender = "",
    this.bloodGroup = "",
    this.dob,
  });
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserData userData = UserData(
    name: "Rajan Sudan",
    email: "rajan.sudan@gmail.com",
    phone: "9876543210",
    address: "123, Main Street",
    city: "New Delhi",
    state: "New Delhi",
    gender: "Male",
    bloodGroup: "O+",
    dob: DateTime(1990, 1, 1),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          "Profile Page",
        ),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: CircleAvatar(
                    backgroundColor: Colors.deepPurple[100],
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: userData.name,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                //Choice chip for gender
                //Male, Female, Other
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ChoiceChip(label: Text("Male"), selected: true),
                    SizedBox(
                      width: 10,
                    ),
                    ChoiceChip(label: Text("Female"), selected: false),
                    SizedBox(
                      width: 10,
                    ),
                    ChoiceChip(label: Text("Other"), selected: false),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: userData.bloodGroup,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: "Blood Group",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                TextFormField(
                  initialValue: userData.email,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: userData.phone,
                  decoration: const InputDecoration(
                    labelText: "Phone",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: userData.address,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CSCPicker(
                  defaultCountry: CscCountry.India,
                  currentCity: userData.city,
                  currentState: userData.state,
                  onCountryChanged: (value) {
                    setState(() {
                      // userData. = value;
                    });
                  },
                  onStateChanged: (value) {
                    setState(() {
                      userData.state = value ?? "";
                    });
                  },
                  onCityChanged: (value) {
                    setState(() {
                      userData.city = value ?? "";
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
