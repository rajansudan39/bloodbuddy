import 'package:flutter/material.dart';

class CampaignCards extends StatelessWidget {
  final String CampaignImagePath;
  final String Rating;
  final String CampaignName;

  const CampaignCards({
    super.key,
    required this.CampaignImagePath,
    required this.Rating,
    required this.CampaignName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
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
                CampaignImagePath,
                height: 100,
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
                  Rating,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            //name of campaign
            Text(
              CampaignName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            //campaign title
          ],
        ),
      ),
    );
  }
}
