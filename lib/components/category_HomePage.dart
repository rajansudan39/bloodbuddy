import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final Image? image;
  final String categoryName;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.categoryName,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: 10, horizontal: 15), //original 20
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.deepPurple[50],
        ),
        child: Row(
          children: [
            image != null
                ? image!
                : Icon(
                    icon,
                    size: 50,
                  ),
            SizedBox(width: 10),
            Text(categoryName),
          ],
        ),
      ),
    );
  }
}
