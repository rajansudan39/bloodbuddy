class UserData {
  String name;
  String email;
  String phone;
  String address;
  String city;
  String state;
  String gender;
  String bloodGroup;
  DateTime? dob;

  UserData({
    this.name = "",
    this.email = "",
    this.phone = "",
    this.address = "",
    this.city = "",
    this.state = "",
    this.gender = "",
    this.bloodGroup = "",
    this.dob,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "address": address,
      "city": city,
      "state": state,
      "gender": gender,
      "bloodGroup": bloodGroup,
      "dob": dob,
    };
  }
}
