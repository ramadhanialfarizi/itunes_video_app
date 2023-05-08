import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:itunes_video_app/core/global_widget/line.dart';
import 'package:itunes_video_app/features/home/model/music_model.dart';
import 'package:itunes_video_app/features/home/model/my_music_model.dart';
import 'package:itunes_video_app/features/home/view/web_view_page.dart';
import 'package:itunes_video_app/features/home/view_model/my_music_provider.dart';
import 'package:itunes_video_app/features/home/view_model/video_controller_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

/// testing : https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    this.result,
    this.myMusicModel,
    required this.favoriteStatus,
  });

  final Result? result;
  final MyMusicModel? myMusicModel;
  final bool? favoriteStatus;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    _initVideoPlayer();
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.pause();
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  void _initVideoPlayer() async {
    if (widget.favoriteStatus == false) {
      // videoPlayerController =
      //     VideoPlayerController.network('${widget.result?.previewUrl}')
      //       ..initialize().then((_) {
      //         setState(() {});
      //       });

      videoPlayerController =
          VideoPlayerController.network('${widget.result?.previewUrl}');

      videoPlayerController.initialize();
      videoPlayerController.play();
    } else {
      // videoPlayerController =
      //     VideoPlayerController.network('${widget.myMusicModel?.previewUrl}')
      //       ..initialize().then((_) {
      //         setState(() {});
      //       });
      videoPlayerController =
          VideoPlayerController.network('${widget.myMusicModel?.previewUrl}');

      videoPlayerController.initialize();
      videoPlayerController.play();
    }

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
    );
  }

  // NOT USED
  Widget videoController(BuildContext context) {
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

  Widget title() {
    if (widget.favoriteStatus == true) {
      return Text(
        widget.myMusicModel?.trackName ?? '',
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      );
    } else {
      return Text(
        widget.result?.trackName ?? '',
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      );
    }
  }

  Widget artistName() {
    if (widget.favoriteStatus == true) {
      return Text(
        widget.myMusicModel?.artistName ?? '',
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      );
    } else {
      return Text(
        widget.result?.artistName ?? '',
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      );
    }
  }

  Widget addMyMusicbutton() {
    if (widget.favoriteStatus == true) {
      return ElevatedButton.icon(
        onPressed: () {
          try {
            context
                .read<MyMusicProvider>()
                .removeMyMusic(widget.myMusicModel?.id);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('remove from my music'),
                duration: Duration(milliseconds: 800),
              ),
            );

            Navigator.pop(context);
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('remove failed'),
                duration: Duration(milliseconds: 800),
              ),
            );
          }
        },
        icon: const Icon(
          Icons.delete,
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
      );
    } else {
      return ElevatedButton.icon(
        onPressed: () {
          try {
            final myMusic = MyMusicModel(
                artistName: widget.result?.artistName,
                artworkUrl100: widget.result?.artworkUrl100,
                collectionName: widget.result?.collectionName,
                previewUrl: widget.result?.previewUrl,
                trackName: widget.result?.trackName,
                artistViewUrl: widget.result?.artistViewUrl,
                collectionViewUrl: widget.result?.collectionViewUrl);

            context.read<MyMusicProvider>().addMyMusic(myMusic);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('add to my music'),
                duration: Duration(milliseconds: 800),
              ),
            );
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('failed add to my music'),
                duration: Duration(milliseconds: 800),
              ),
            );
          }
        },
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
      );
    }
  }

  Widget seeArtistProfileButton() {
    if (widget.favoriteStatus == true) {
      return OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  WebViewDetailPage(url: widget.myMusicModel?.artistViewUrl),
            ),
          );
        },
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            const BorderSide(
              color: Color(0xFFEA4CC0),
            ),
          ),
        ),
        child: const Text(
          'See artist profile',
          style: TextStyle(color: Color(0xFFEA4CC0)),
        ),
      );
    } else {
      return OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  WebViewDetailPage(url: widget.result?.artistViewUrl),
            ),
          );
        },
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            const BorderSide(
              color: Color(0xFFEA4CC0),
            ),
          ),
        ),
        child: const Text(
          'See artist profile',
          style: TextStyle(color: Color(0xFFEA4CC0)),
        ),
      );
    }
  }

  Widget albumName() {
    if (widget.favoriteStatus == true) {
      return Text(
        widget.myMusicModel?.collectionName ?? 'not found',
        style: const TextStyle(fontWeight: FontWeight.w300),
      );
    } else {
      return Text(
        widget.result?.collectionName ?? 'not found',
        style: const TextStyle(fontWeight: FontWeight.w300),
      );
    }
  }

  Widget seeAlbumInformation() {
    if (widget.favoriteStatus == true) {
      if (widget.myMusicModel?.collectionViewUrl == null) {
        return const SizedBox();
      } else {
        return OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WebViewDetailPage(
                    url: widget.myMusicModel?.collectionViewUrl),
              ),
            );
          },
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              const BorderSide(
                color: Color(0xFFEA4CC0),
              ),
            ),
          ),
          child: const Text(
            'See music information',
            style: TextStyle(color: Color(0xFFEA4CC0)),
          ),
        );
      }
    } else {
      if (widget.result?.collectionViewUrl == null) {
        return const SizedBox();
      } else {
        return OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    WebViewDetailPage(url: widget.result?.collectionViewUrl),
              ),
            );
          },
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              const BorderSide(
                color: Color(0xFFEA4CC0),
              ),
            ),
          ),
          child: const Text(
            'See music information',
            style: TextStyle(color: Color(0xFFEA4CC0)),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   //height: 595,
              //   decoration: const BoxDecoration(
              //     borderRadius: BorderRadius.only(
              //       bottomLeft: Radius.circular(30),
              //       bottomRight: Radius.circular(30),
              //     ),
              //     color: Colors.black,
              //   ),
              //   child: Column(
              //     children: [
              //       // const SizedBox(
              //       //   height: 86,
              //       //   // height: 100,
              //       // ),
              //       // AspectRatio(
              //       //   aspectRatio: videoPlayerController.value.aspectRatio,
              //       //   child: videoPlayerController.value.isInitialized
              //       //       ? VideoPlayer(videoPlayerController)
              //       //       : const Padding(
              //       //           padding: EdgeInsets.all(8),
              //       //           child: CircularProgressIndicator(),
              //       //         ),
              //       // ),
              //       // const SizedBox(
              //       //   height: 16,
              //       // ),
              //       //videoController(context),
              //       Chewie(controller: chewieController!),
              //       // const SizedBox(
              //       //   height: 16,
              //       //   // height: 100,
              //       // ),
              //     ],
              //   ),
              // ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Chewie(
                    controller: chewieController!,
                  ),
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
                      title(),
                      const SizedBox(
                        height: 7,
                      ),
                      artistName(),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: addMyMusicbutton(),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: seeArtistProfileButton(),
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
                      albumName(),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: seeAlbumInformation(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
