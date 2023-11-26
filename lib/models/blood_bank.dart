class BloodBank {
  String? id;
  String name;
  String email;
  String description;
  List<String> contacts;
  String address;
  String city;
  String state;
  bool isVerified;
  bool isDriveOn;
  String? imageUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  BloodBank({
    this.id,
    this.name = "",
    this.description = "",
    this.email = "",
    required this.contacts,
    this.address = "",
    this.city = "",
    this.state = "",
    this.isVerified = false,
    this.isDriveOn = false,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "about_us": description,
      "email": email,
      "contacts": contacts,
      "address": address,
      "city": city,
      "state": state,
      "isVerified": isVerified,
      "isDriveOn": isDriveOn,
      "imageUrl": imageUrl,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }

  factory BloodBank.fromJson(Map<String, dynamic> json, String id) {
    return BloodBank(
      id: id,
      name: json["name"] ?? "",
      description: json["about_us"] ?? "",
      email: json["email"] ?? "",
      contacts: List<String>.from(json["contacts"] ?? []),
      address: json["address"] ?? "",
      city: json["city"] ?? "",
      state: json["state"] ?? "",
      isVerified: json["isVerified"] ?? false,
      isDriveOn: json["isDriveOn"] ?? false,
      imageUrl: json["imageUrl"] ?? "",
      createdAt: json["createdAt"]?.toDate(),
      updatedAt: json["updatedAt"]?.toDate(),
    );
  }

  BloodBank copyWith({
    String? id,
    String? name,
    String? email,
    List<String>? contacts,
    String? address,
    String? city,
    String? state,
    bool? isVerified,
    bool? isDriveOn,
    String? imageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return BloodBank(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      contacts: contacts ?? this.contacts,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      isVerified: isVerified ?? this.isVerified,
      isDriveOn: isDriveOn ?? this.isDriveOn,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
