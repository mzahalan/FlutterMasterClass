

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_tut/models/app_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StreamProvider.autoDispose<AppUser?>((ref) async* {
  // subscribe to firebase auth changes
  final Stream<AppUser?> userStream = FirebaseAuth.instance.authStateChanges().map((user) {
    if (user == null) {
      return null;
    } else {
      return AppUser(uid: user.uid, email: user.email!);
    }
  });

  //yield when we get a new value
  await for (final user in userStream) {
    yield user;
  }
});