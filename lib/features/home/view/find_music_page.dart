import 'dart:math';

import 'package:flutter/material.dart';
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
        title: const Text('Find music'),
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
                      hintText: 'find your music...',
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
                Text('halloooo')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
