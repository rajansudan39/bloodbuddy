import 'package:cloud_firestore/cloud_firestore.dart';

class Emergency {
  String? id;
  String name;
  String description;
  String image;
  List<String> bloodGroups;
  DateTime? createdAt;
  DateTime? updatedAt;

  Emergency({
    this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.bloodGroups,
    this.createdAt,
    this.updatedAt,
  });

  factory Emergency.fromJson(Map<String, dynamic> json, String id) {
    return Emergency(
      id: id,
      name: json['name'],
      description: json['description'],
      bloodGroups: List<String>.from(json["bloodGroups"] ?? []),
      image: json['image'],
      createdAt: json['createdAt'].toDate(),
      updatedAt: json['updatedAt'].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'bloodGroups': bloodGroups,
      'image': image,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      'updatedAt': createdAt != null ? Timestamp.fromDate(updatedAt!) : null,
    };
  }
}
