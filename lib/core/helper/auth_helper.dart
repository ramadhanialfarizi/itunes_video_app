import 'dart:math';

import 'package:itunes_video_app/core/helper/repository.dart';
import 'package:itunes_video_app/features/authentication/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper implements AuthHelperRepository {
  final FirebaseAuth _authentication = FirebaseAuth.instance;

  @override
  Future signupManually(UserModel userModel) async {
    try {
      final signUpManual = await _authentication.createUserWithEmailAndPassword(
          email: userModel.email, password: userModel.password);

      return signUpManual;
    } on FirebaseAuthException catch (e) {
      // print(e.code);
      if (e.code == "email-already-in-use") {
        return "Email already in use";
      }
    }
  }

  @override
  Future signinManually(UserModel userModel) async {
    if (_authentication.currentUser == null) {
      try {
        final signInManual = await _authentication.signInWithEmailAndPassword(
            email: userModel.email, password: userModel.password);

        return signInManual;
      } on FirebaseAuthException catch (e) {
        print(e.code);
        return null;
      }
    }
  }

  @override
  Future signOut() async {
    try {
      final signOut = await FirebaseAuth.instance.signOut();

      return signOut;
    } catch (e) {
      rethrow;
    }
  }
}
