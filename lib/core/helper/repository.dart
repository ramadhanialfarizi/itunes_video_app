import '../../features/authentication/model/user_model.dart';

abstract class AuthHelperRepository {
  Future signupManually(UserModel userModel);

  Future signinManually(UserModel userModel);

  Future signOut();
}
