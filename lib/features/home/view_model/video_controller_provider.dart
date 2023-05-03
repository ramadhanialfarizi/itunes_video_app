import 'package:flutter/material.dart';

class VideoControllerProvider extends ChangeNotifier {
  bool videoIsPlay = true;

  void changeVideoPlay() {
    videoIsPlay = !videoIsPlay;
    notifyListeners();
  }
}
