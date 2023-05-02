import '../music_model.dart';

abstract class MusicRepository {
  Future<FindMusicModel> getFindMusic(String? query);
}
