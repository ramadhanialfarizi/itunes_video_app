import 'package:flutter/material.dart';
import 'package:itunes_video_app/features/home/model/music_model.dart';
import 'package:itunes_video_app/features/home/view/detail_page.dart';

class FindMusicList extends StatefulWidget {
  const FindMusicList({super.key, required this.findMusicModel});

  final FindMusicModel? findMusicModel;

  @override
  State<FindMusicList> createState() => _FindMusicListState();
}

class _FindMusicListState extends State<FindMusicList> {
  final bool favoriteStatus = false;

  @override
  Widget build(BuildContext context) {
    // return GridView.builder(
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     mainAxisSpacing: 10.0,
    //     crossAxisSpacing: 10.0,
    //     mainAxisExtent: 185,
    //   ),
    //   physics: const NeverScrollableScrollPhysics(),
    //   shrinkWrap: true,
    //   itemCount: widget.findMusicModel?.results?.length,
    //   itemBuilder: (context, index) {
    //     return InkWell(
    //       onTap: () {},
    //       child: Column(
    //         children: [
    //           // ClipRRect(
    //           //   borderRadius: const BorderRadius.only(
    //           //       bottomLeft: Radius.circular(13),
    //           //       bottomRight: Radius.circular(13),
    //           //       topLeft: Radius.circular(13),
    //           //       topRight: Radius.circular(13)),
    //           //   child: Image.network(
    //           //     '${widget.findMusicModel?.results?[index].artworkUrl100}',
    //           //     height: 100,
    //           //     width: 200,
    //           //     fit: BoxFit.fitWidth,
    //           //   ),
    //           // ),
    //           Container(
    //             width: 150,
    //             height: 90,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(12),
    //               image: DecorationImage(
    //                 image: NetworkImage(
    //                     '${widget.findMusicModel?.results?[index].artworkUrl100}',
    //                     scale: 10),
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //             child: const SizedBox(),
    //           ),
    //           const SizedBox(
    //             height: 19,
    //           ),
    //           Text('${widget.findMusicModel?.results?[index].trackName}')
    //         ],
    //       ),
    //     );
    //   },
    // );
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
                    findMusicModel: widget.findMusicModel,
                    favoriteStatus: favoriteStatus,
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
