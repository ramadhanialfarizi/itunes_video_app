import 'package:flutter/material.dart';
import 'package:itunes_video_app/core/global_widget/empty_data.dart';
import 'package:itunes_video_app/core/global_widget/error.dart';
import 'package:itunes_video_app/core/utils/enum.dart';
import 'package:itunes_video_app/features/home/view/widget/init_find_music.dart';
import 'package:itunes_video_app/features/home/view/widget/music_list.dart';
import 'package:itunes_video_app/features/home/view_model/find_music_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/global_widget/sidebar.dart';

class FindMusicPage extends StatefulWidget {
  const FindMusicPage({super.key});

  @override
  State<FindMusicPage> createState() => _FindMusicPageState();
}

class _FindMusicPageState extends State<FindMusicPage> {
  TextEditingController searchController = TextEditingController();

  final bool favoriteStatus = false;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text(
          'Find music',
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
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'find a music...',
                      //labelText: 'Email',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      suffixIconColor: const Color(0xFFEA4CC0),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          context
                              .read<FindMusicProvider>()
                              .getFindMusic(searchController.text);
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Consumer<FindMusicProvider>(
                  builder: (context, findMusicValue, child) {
                    if (findMusicValue.state == ResultState.init) {
                      return const InitFindMusic();
                    } else if (findMusicValue.state == ResultState.loading) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 5.3,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (findMusicValue.state == ResultState.hasData) {
                      /// CHange here
                      return MusicList(
                        findMusicModel: findMusicValue.findMusicModel,
                        favoriteStatus: favoriteStatus,
                      );
                    } else if (findMusicValue.state == ResultState.noData) {
                      return const EmptyData();
                    } else {
                      return const ErrorData();
                    }
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
