import 'package:flutter/material.dart';
import 'package:itunes_video_app/core/utils/enum.dart';
import 'package:itunes_video_app/features/home/model/data_source/music_data_source_impl.dart';
import 'package:itunes_video_app/features/home/model/data_source/music_repository.dart';
import 'package:itunes_video_app/features/home/model/music_model.dart';

class FindMusicProvider extends ChangeNotifier {
  final MusicRepository _musicRepository = MusicDataSourceImpl();

  ResultState? state;
  FindMusicModel? findMusicModel;

  void getFindMusic(String? query) async {
    final source = await _musicRepository.getFindMusic(query);
  }
}
