import 'package:vax_pass_flutter/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference vaxData =
      FirebaseFirestore.instance.collection('vax_database');

  DatabaseService();

  Future<void> updateUserData(
      String uid, String name, String email, String healthCardNo) async {
    return await userCollection
        .doc(uid)
        .set({'name': name, 'email': email, 'hno': healthCardNo});
  }

  Future<UserData> getUserData(String uid) async {
    DocumentSnapshot user = await userCollection.doc(uid).get();
    return UserData(
        uid: uid,
        name: user['name'],
        email: user['email'],
        healthCardNo: user['hno']);
  }

  Future<HealthRecord> getUserHealthRecord(String uid) async {
    DocumentSnapshot user = await userCollection.doc(uid).get();
    String hcn = user['healthCardNo'];
    DocumentSnapshot vaxRecord = await vaxData.doc(hcn).get();

    return HealthRecord(
        dateOfBirth: vaxRecord['date_of_birth'],
        doseOneAgent: vaxRecord['dose_one_agent'],
        doseOneDate: vaxRecord['dose_one_date'],
        doseOneLocation: vaxRecord['dose_one_location'],
        doseTwoAgent: vaxRecord['dose_two_agent'],
        doseTwoDate: vaxRecord['dose_two_date'],
        doseTwoLocation: vaxRecord['dose_two_location']);
  }

  Future<bool> checkVaxDatabase(String healthCardNo) async {
    DocumentSnapshot data = await vaxData.doc(healthCardNo).get();
    return data.exists;
  }
}
