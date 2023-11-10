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
}
