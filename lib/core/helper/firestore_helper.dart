import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:itunes_video_app/core/helper/repository.dart';
import 'package:itunes_video_app/features/home/model/my_music_model.dart';

class FirestoreHelper implements FirestoreHelperRepository {
  final curentUser = FirebaseAuth.instance;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future addMyMusic(MyMusicModel myMusicModel) async {
    CollectionReference collectionReference = firebaseFirestore
        .collection('my_music_db')
        .doc(curentUser.currentUser!.email)
        .collection('my_music');

    try {
      final myMusicData = await collectionReference.add({
        'trackName': myMusicModel.trackName,
        'artistName': myMusicModel.artistName,
        'atworkUrl': myMusicModel.artworkUrl100,
        'collectionName': myMusicModel.collectionName,
        'previewUrl': myMusicModel.previewUrl,
      });

      return myMusicData;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteMyMusic(String? documentID) {
    CollectionReference collectionReference = firebaseFirestore
        .collection('my_music_db')
        .doc(curentUser.currentUser!.email)
        .collection('my_music');

    try {
      var deleteMusic = collectionReference.doc(documentID).delete();

      return deleteMusic;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<QuerySnapshot<Object?>> getMusicData() {
    try {
      final Stream<QuerySnapshot> musicDataStream = firebaseFirestore
          .collection('my_music_db')
          .doc(curentUser.currentUser!.email)
          .collection('my_music')
          .snapshots();

      return musicDataStream;
    } catch (e) {
      rethrow;
    }
  }
}
