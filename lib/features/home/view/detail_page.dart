import 'package:flutter/material.dart';
import 'package:itunes_video_app/core/global_widget/line.dart';
import 'package:itunes_video_app/features/home/model/music_model.dart';
import 'package:itunes_video_app/features/home/view_model/video_controller_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

/// testing : https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.result,
    required this.favoriteStatus,
  });

  final Result? result;
  final bool favoriteStatus;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    //print(widget.result?.previewUrl);
    videoPlayerController =
        VideoPlayerController.network('${widget.result?.previewUrl}')
          ..initialize().then((_) {
            setState(() {});
          });
    videoPlayerController.play();
    //videoPlayerController.setVolume(20);
    //videoPlayerController.
    //videoPlayerController.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //height: 595,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Colors.black,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 86,
                    // height: 100,
                  ),
                  AspectRatio(
                    aspectRatio: videoPlayerController.value.aspectRatio,
                    child: videoPlayerController.value.isInitialized
                        ? VideoPlayer(videoPlayerController)
                        : const Padding(
                            padding: EdgeInsets.all(8),
                            child: CircularProgressIndicator(),
                          ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  videoController(),
                  const SizedBox(
                    height: 16,
                    // height: 100,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.result?.trackName ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      widget.result?.artistName ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (widget.favoriteStatus == true) ...[
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          color: Colors.white,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFEA4CC0),
                          ),
                        ),
                        label: const Text(
                          'remove music',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ] else ...[
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFEA4CC0),
                          ),
                        ),
                        label: const Text(
                          'add to my music',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      const Line(
                        color: Color(0xFFEA4CC0),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      const Text(
                        'Album Name',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        widget.result?.collectionName ?? 'not found',
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ]
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget videoController() {
    return Consumer<VideoControllerProvider>(
      builder: (context, controllerValue, __) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: IconButton(
                onPressed: () {
                  videoPlayerController.play();
                },
                icon: const Icon(
                  Icons.replay,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.fast_rewind,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                  onPressed: () {
                    context.read<VideoControllerProvider>().changeVideoPlay();

                    if (controllerValue.videoIsPlay == true) {
                      videoPlayerController.pause();
                    } else {
                      videoPlayerController.play();
                    }
                  },
                  icon: (controllerValue.videoIsPlay == true)
                      ? const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.pause,
                          color: Colors.white,
                        )),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.fast_forward,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.fullscreen,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
