import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:itunes_video_app/core/helper/firestore_helper.dart';
import 'package:itunes_video_app/core/helper/repository.dart';
import 'package:itunes_video_app/features/home/model/my_music_model.dart';

class MyMusicProvider extends ChangeNotifier {
  final FirestoreHelperRepository _firestoreHelperRepository =
      FirestoreHelper();

  void addMyMusic(MyMusicModel myMusicModel) async {
    await _firestoreHelperRepository.addMyMusic(myMusicModel);
  }

  void removeMyMusic(String? documentID) async {
    await _firestoreHelperRepository.deleteMyMusic(documentID);
  }

  Stream<QuerySnapshot> getAllMusic() {
    return _firestoreHelperRepository.getMusicData();
  }
}
