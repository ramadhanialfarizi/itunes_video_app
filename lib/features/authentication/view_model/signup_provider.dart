import 'package:flutter/material.dart';
import 'package:itunes_video_app/core/helper/auth_helper.dart';
import 'package:itunes_video_app/core/helper/repository.dart';
import 'package:itunes_video_app/features/authentication/model/user_model.dart';

class SignupProvider extends ChangeNotifier {
  final AuthHelperRepository _authHelperRepository = AuthHelper();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  bool usernameValid = false;
  bool emailValid = false;
  bool passwordValid = false;
  bool confirmPasswordValid = false;

  bool? error;

  String? messageError;

  /// USERNAME
  void usernameValidFalse() {
    usernameValid = true;
    notifyListeners();
  }

  void usernameValidTrue() {
    usernameValid = false;
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

  /// CONFIRM PASSWORD
  void confirmPasswordValidFalse() {
    confirmPasswordValid = true;
    notifyListeners();
  }

  void confirmPasswordValidTrue() {
    confirmPasswordValid = false;
    notifyListeners();
  }

  void changeObsecurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void changeObscureConfirmPassword() {
    obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }

  void resetAll() {
    obscurePassword = true;
    obscureConfirmPassword = true;
    usernameValid = false;
    emailValid = false;
    passwordValid = false;
    confirmPasswordValid = false;
    notifyListeners();
  }

  Future<void> signupManually(UserModel userModel) async {
    var signup = await _authHelperRepository.signupManually(userModel);

    if (signup == 'Email already in use') {
      error = true;
      messageError = 'Email already in use';
      notifyListeners();
    } else {
      error = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await _authHelperRepository.signOut();
    notifyListeners();
  }
}
