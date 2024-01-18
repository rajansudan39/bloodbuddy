import 'package:flutter/material.dart';

class CampaignRegistrationPage extends StatefulWidget {
  const CampaignRegistrationPage({super.key});

  @override
  State<CampaignRegistrationPage> createState() =>
      _CampaignRegistrationPageState();
}

class _CampaignRegistrationPageState extends State<CampaignRegistrationPage> {
  bool isChecked = false;

  List<String> general = [];
  List<String> tempDifferment = [];
  List<String> permanentDifferment = [];

  List<String> generalOptions = [
    "Acute respiratory disease",
    "Skin disease at the phlebotomy site",
    "Alcoholism",
    "Transfusion",
    "Scars on arm or forearm",
    "Drug addiction",
    "Multiple sex partners",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registration",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "General",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                generateCheckboxList(generalOptions),
                Text(
                  "Temporary Differment",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                generateCheckboxList(generalOptions),
                Text(
                  "Permanent Differment",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                generateCheckboxList(generalOptions),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[300],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () async {
                    // await Database().registerCampaign(campaign);
                    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //     content: Text("Registred Successfully")));
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget generateCheckboxList(List<String> list) {
    return Wrap(
      children: [
        for (var item in list)
          CheckboxListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(
              item,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            value: general.contains(item),
            onChanged: (newValue) {
              setState(() {
                if (newValue == true) {
                  general.add(item);
                } else {
                  general.remove(item);
                }
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          ),
      ],
    );
  }
}
