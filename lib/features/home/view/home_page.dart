import 'package:flutter/material.dart';
import 'package:itunes_video_app/core/global_widget/sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: false,
      ),
    );
  }
}
