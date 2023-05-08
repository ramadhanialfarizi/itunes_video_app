import 'package:flutter/material.dart';
import 'package:itunes_video_app/features/home/model/music_model.dart';
import 'package:itunes_video_app/features/home/view/detail_page.dart';

class MusicList extends StatefulWidget {
  const MusicList(
      {super.key, required this.findMusicModel, required this.favoriteStatus});

  final FindMusicModel? findMusicModel;
  final bool? favoriteStatus;

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  //final bool favoriteStatus = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.findMusicModel?.results!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 30),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    result: widget.findMusicModel?.results?[index],
                    favoriteStatus: widget.favoriteStatus,
                  ),
                ),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(
                        '${widget.findMusicModel?.results![index].artworkUrl100}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.findMusicModel!.results![index].trackName ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.findMusicModel!.results![index].artistName ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
