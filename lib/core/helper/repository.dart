import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:itunes_video_app/features/home/model/my_music_model.dart';

import '../../features/authentication/model/user_model.dart';

abstract class AuthHelperRepository {
  Future signupManually(UserModel userModel);

  Future signinManually(UserModel userModel);

  Future signOut();
}

abstract class FirestoreHelperRepository {
  Future addMyMusic(MyMusicModel myMusicModel);

  Future deleteMyMusic(String? documentSnapshot);

  Stream<QuerySnapshot> getMusicData();
}
