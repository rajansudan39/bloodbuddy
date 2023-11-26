import 'package:bloodbuddy/models/campaign.dart';
import 'package:bloodbuddy/service/database.dart';
import 'package:flutter/material.dart';

class CampaignRegistrationPage extends StatelessWidget {
  const CampaignRegistrationPage({super.key, required this.campaign});
  final Campaign campaign;

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
                    radius: 60,
                    backgroundImage: NetworkImage(campaign.image),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  campaign.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  campaign.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[300],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () async {
                    await Database().registerCampaign(campaign);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Registred Successfully")));
                  },
                  child: Text("Register"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
