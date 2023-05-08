import 'package:flutter/material.dart';
import 'package:itunes_video_app/core/utils/enum.dart';
import 'package:itunes_video_app/features/home/model/data_source/music_data_source_impl.dart';
import 'package:itunes_video_app/features/home/model/data_source/music_repository.dart';
import 'package:itunes_video_app/features/home/model/music_model.dart';

class FindMusicProvider extends ChangeNotifier {
  final MusicRepository _musicRepository = MusicDataSourceImpl();

  ResultState? state = ResultState.init;
  FindMusicModel? findMusicModel;

  void getFindMusic(String? query) async {
    try {
      state = ResultState.loading;
      notifyListeners();
      final source = await _musicRepository.getFindMusic(query);

      if (source.results!.isEmpty) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        findMusicModel = source;
        notifyListeners();
      }
    } catch (e) {
      state = ResultState.error;
      notifyListeners();
    }
  }
}
