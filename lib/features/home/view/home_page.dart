import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:itunes_video_app/core/global_widget/empty_data.dart';
import 'package:itunes_video_app/core/global_widget/error.dart';
import 'package:itunes_video_app/features/home/model/my_music_model.dart';
import 'package:itunes_video_app/features/home/view/widget/music_list.dart';
import 'package:itunes_video_app/features/home/view_model/my_music_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/global_widget/sidebar.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bool favoriteStatus = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: Color(0xFFEA4CC0),
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My Music',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 241, 139, 214),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Consumer<MyMusicProvider>(
                  builder: (context, myMusicValue, child) {
                    return StreamBuilder<QuerySnapshot>(
                      stream: myMusicValue.getAllMusic(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const ErrorData();
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height / 5.3,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              final item = snapshot.data?.docs[index];
                              snapshot.data?.docs[index].id;
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 30),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                          myMusicModel: MyMusicModel(
                                            id: snapshot.data?.docs[index].id,
                                            artistName: item?['artistName'],
                                            artworkUrl100: item?['atworkUrl'],
                                            collectionName:
                                                item?['collectionName'],
                                            previewUrl: item?['previewUrl'],
                                            trackName: item?['trackName'],
                                          ),
                                          favoriteStatus: favoriteStatus,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              '${item?['atworkUrl']}',
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item?['trackName'] ?? '',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              item?['artistName'] ?? '',
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
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
