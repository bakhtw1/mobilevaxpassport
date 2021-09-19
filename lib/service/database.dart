import 'package:vax_pass_flutter/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference vaxData =
      FirebaseFirestore.instance.collection('vax_database');

  DatabaseService({required this.uid});

  Future<void> updateUserData(
      String name, String email, String healthCardNo) async {
    return await userCollection
        .doc(uid)
        .set({'name': name, 'email': email, 'hno': healthCardNo});
  }

  Future<bool> checkVaxDatabase(String healthCardNo) async {
    DocumentSnapshot data = await vaxData.doc(healthCardNo).get();
    return data.exists;
  }
}
