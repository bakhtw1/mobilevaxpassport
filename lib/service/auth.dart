import 'package:firebase_auth/firebase_auth.dart';
import 'package:vax_pass_flutter/models/user.dart';
import 'package:vax_pass_flutter/service/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CustomUser _customUserForFirebaseUser(User user) {
    return CustomUser(uid: user.uid);
  }

  Stream<CustomUser> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _customUserForFirebaseUser(user!));
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

    return _auth.currentUser;
  }

  // register with email and password
  Future registerWithEmailAndPassword(
      String email, String password, String healthCardNo, String name) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = _auth.currentUser!;

      await DatabaseService(uid: user.uid)
          .updateUserData(name, email, healthCardNo);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    return _auth.currentUser;
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
