import 'dart:math';

import 'package:bloodbuddy/models/campaign.dart';
import 'package:bloodbuddy/pages/campaign_details_page.dart';
import 'package:flutter/material.dart';

class CampaignCards extends StatelessWidget {
  final Campaign campaign;

  const CampaignCards({
    super.key,
    required this.campaign,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CampaignDetailsPage(
                campaign: campaign,
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepPurple[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              //picture of a campaigns
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  campaign.image,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),

              //rating out of 5
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow[600],
                  ),
                  Text(
                    getRating().toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              //name of campaign
              Text(
                campaign.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              //campaign title
            ],
          ),
        ),
      ),
    );
  }
}

int getRating() {
  //Return random float number between 3 and 5
  return Random().nextInt(3) + 3;
}
