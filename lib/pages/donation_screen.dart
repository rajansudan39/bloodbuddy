import 'package:bloodbuddy/models/blood_bank.dart';
import 'package:bloodbuddy/service/database.dart';
import 'package:flutter/material.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  late Future<List<BloodBank>> campaigns;

  void getData() {
    campaigns = Database().getBloodBanks();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blood Banks"),
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: campaigns,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return BloodBankCard(
                      bloodBank: snapshot.data![index],
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class BloodBankCard extends StatelessWidget {
  const BloodBankCard({
    super.key,
    required this.bloodBank,
  });

  final BloodBank bloodBank;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(
        //   PageTransition(
        //     child: EmergencyDetailsPage(
        //       emergency: campaign,
        //     ),
        //     type: PageTransitionType.bottomToTop,
        //   ),
        // );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Column(
          children: [
            // Container(
            //   height: 200,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     borderRadius: const BorderRadius.only(
            //       topLeft: Radius.circular(10),
            //       topRight: Radius.circular(10),
            //     ),
            //     // image: DecorationImage(
            //     //   image: NetworkImage(
            //     //     bloodBank.image,
            //     //   ),
            //     //   fit: BoxFit.cover,
            //     // ),
            //   ),
            // ),
            ListTile(
              title: Text(
                bloodBank.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              subtitle: Text(
                bloodBank.description,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
