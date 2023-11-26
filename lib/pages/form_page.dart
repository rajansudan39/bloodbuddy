import 'package:bloodbuddy/models/user_data.dart';
import 'package:bloodbuddy/pages/auth_page.dart';
import 'package:bloodbuddy/service/database.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  UserData userData = UserData(
    bloodGroup: "A+",
  );

  List<String> bloodGroups = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          "Registration",
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
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CircleAvatar(
                    backgroundColor: Colors.deepPurple[100],
                    radius: 50,
                    child: const Icon(
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
                  onChanged: (value) {
                    setState(() {
                      userData.name = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                //Choice chip for gender
                //Male, Female, Other
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ChoiceChip(
                      label: const Text("Male"),
                      onSelected: ((value) {
                        setState(() {
                          userData.gender = "Male";
                        });
                      }),
                      selected: userData.gender == "Male",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ChoiceChip(
                      label: const Text("Female"),
                      onSelected: ((value) {
                        setState(() {
                          userData.gender = "Female";
                        });
                      }),
                      selected: userData.gender == "Female",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //Drop down for blood groups
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: userData.bloodGroup,
                    items: List.generate(
                      bloodGroups.length,
                      (index) => DropdownMenuItem(
                        value: bloodGroups[index],
                        child: Text(
                          bloodGroups[index],
                        ),
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        userData.bloodGroup = val ?? "";
                      });
                    },
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
                  onChanged: (val) {
                    setState(() {
                      userData.phone = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: userData.address,
                  onChanged: (val) {
                    setState(() {
                      userData.address = val;
                    });
                  },
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
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[300],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () async {
                await Database().createUser(userData);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CheckSignUp()));
              },
              child: const Text(
                "Submit",
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
