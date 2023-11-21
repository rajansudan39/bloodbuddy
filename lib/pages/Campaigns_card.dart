import 'package:flutter/material.dart';

class CampaignCards extends StatelessWidget {
  final String image;
  final String rating;
  final String name;

  const CampaignCards({
    super.key,
    required this.image,
    required this.rating,
    required this.name,
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
                image,
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
                  rating,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            //name of campaign
            Text(
              name,
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
