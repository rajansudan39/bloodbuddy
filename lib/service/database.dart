import 'package:bloodbuddy/models/blood_bank.dart';
import 'package:bloodbuddy/models/campaign.dart';
import 'package:bloodbuddy/models/emergency.dart';
import 'package:bloodbuddy/models/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  Future createUser(UserData userData) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var userCol = FirebaseFirestore.instance.collection("users");
    userCol.doc(uid).set(userData.toMap());
  }

  Future<bool> userExist() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get()
        .then((value) => value.exists);
  }

  final campaignCollection = FirebaseFirestore.instance.collection('campaigns');

  Future<List<Campaign>> getCampaigns() async {
    // code to get campaigns
    final snapshot = await campaignCollection.get();
    return snapshot.docs
        .map((doc) => Campaign.fromJson(doc.data(), doc.id))
        .toList();
  }

  Future registerCampaign(
    Campaign campaign,
  ) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    await campaignCollection
        .doc(campaign.id)
        .collection("registrations")
        .doc(uid)
        .set({
      "uid": uid,
      "isDonated": false,
    });
    return;
  }

  final emergencyCollection =
      FirebaseFirestore.instance.collection('emergency_campaigns');

  Future<List<Emergency>> getEmergencyCampaigns() async {
    // code to get campaigns
    final snapshot = await emergencyCollection.get();
    return snapshot.docs
        .map((doc) => Emergency.fromJson(doc.data(), doc.id))
        .toList();
  }

  final bloodBanksCollection =
      FirebaseFirestore.instance.collection('blood_banks');

  Future<List<BloodBank>> getBloodBanks() async {
    // code to get campaigns
    final snapshot = await bloodBanksCollection.get();
    return snapshot.docs
        .map((doc) => BloodBank.fromJson(doc.data(), doc.id))
        .toList();
  }
}
