import 'package:flutter/material.dart';

import '../../../core/global_widget/sidebar.dart';

class FindMusicPage extends StatefulWidget {
  const FindMusicPage({super.key});

  @override
  State<FindMusicPage> createState() => _FindMusicPageState();
}

class _FindMusicPageState extends State<FindMusicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text('Find music'),
        centerTitle: false,
      ),
    );
  }
}
