import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String categoryName;
  const CategoryCard({
    required this.icon,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: 8, horizontal: 10), //original 20
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.deepPurple[100],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
            ),
            SizedBox(width: 10),
            Text(categoryName),
          ],
        ),
      ),
    );
  }
}
