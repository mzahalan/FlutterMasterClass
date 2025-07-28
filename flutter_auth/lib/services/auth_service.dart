import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_tut/models/app_user.dart';

class AuthService {

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user
  static Future<AppUser?> signup(String email, String password) async {
    try {
      final UserCredential res = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if(res.user != null) {
        return AppUser(uid: res.user!.uid, email: res.user!.email!);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }


  // Sign In
  static Future<AppUser?> signIn(String email, String password) async {
    try {
      final UserCredential res = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(res.user != null) {
        return AppUser(uid: res.user!.uid, email: res.user!.email!);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  // Sign Out
  static Future<void> signOut() async {
    await _auth.signOut();
  }



}