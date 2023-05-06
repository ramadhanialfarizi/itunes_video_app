import 'package:flutter/material.dart';

class VideoControllerProvider extends ChangeNotifier {
  bool? videoIsPlay = false;

  // VideoControllerProvider({
  //   this.videoIsPlay,
  // });

  void changeVideoPlay() {
    videoIsPlay = !videoIsPlay!;
    notifyListeners();
  }
}
