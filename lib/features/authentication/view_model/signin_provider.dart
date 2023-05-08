import 'package:flutter/material.dart';
import 'package:itunes_video_app/core/helper/auth_helper.dart';
import 'package:itunes_video_app/core/helper/repository.dart';
import 'package:itunes_video_app/features/authentication/model/user_model.dart';

class SigninProvider extends ChangeNotifier {
  final AuthHelperRepository _authHelperRepository = AuthHelper();

  bool obscurePassword = true;
  bool emailValid = false;
  bool passwordValid = false;

  bool? error;

  void changeObsecurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  /// EMAIL
  void emailValidFalse() {
    emailValid = true;
    notifyListeners();
  }

  void emailValidTrue() {
    emailValid = false;
    notifyListeners();
  }

  /// PASSWORD
  void passwordValidFalse() {
    passwordValid = true;
    notifyListeners();
  }

  void passwordValidTrue() {
    passwordValid = false;
    notifyListeners();
  }

  Future<void> signinManually(UserModel userModel) async {
    var signin = await _authHelperRepository.signinManually(userModel);

    if (signin == null) {
      error = true;
      notifyListeners();
    } else {
      error = false;
      notifyListeners();
    }
  }
}
