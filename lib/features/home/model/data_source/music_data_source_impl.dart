import 'package:dio/dio.dart';

import 'package:itunes_video_app/features/home/model/data_source/music_repository.dart';
import 'package:itunes_video_app/features/home/model/music_model.dart';

class MusicDataSourceImpl implements MusicRepository {
  @override
  Future<FindMusicModel> getFindMusic(String? query) async {
    try {
      var response = await Dio().get(
        'https://itunes.apple.com/search?',
        queryParameters: {
          'entity': 'musicVideo',
          'term': query,
        },
      );

      if (response.statusCode == 200) {
        print(response.data);

        var result = FindMusicModel.fromJson(response.data);

        return result;
      } else {
        print('Error, status code : ${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }
}
