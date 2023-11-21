import 'package:cloud_firestore/cloud_firestore.dart';

class Campaign {
  String? id;
  String name;
  String description;
  String? rating;
  String image;
  DateTime? createdAt;
  DateTime? updatedAt;

  Campaign({
    this.id,
    required this.name,
    required this.description,
    this.rating,
    required this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Campaign.fromJson(Map<String, dynamic> json, String id) {
    return Campaign(
      id: id,
      name: json['name'],
      description: json['description'],
      rating: json['rating'],
      image: json['image'],
      createdAt: json['createdAt'].toDate(),
      updatedAt: json['updatedAt'].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'rating': rating,
      'image': image,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      'updatedAt': createdAt != null ? Timestamp.fromDate(updatedAt!) : null,
    };
  }
}
