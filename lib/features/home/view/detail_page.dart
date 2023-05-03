import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:itunes_video_app/features/home/model/music_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.findMusicModel,
    required this.favoriteStatus,
  });

  final FindMusicModel? findMusicModel;
  final bool favoriteStatus;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
