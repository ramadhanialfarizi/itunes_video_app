import 'package:flutter/material.dart';

import '../../../core/global_widget/sidebar.dart';

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
        title: const Text(
          'Home',
          style: TextStyle(
            color: Color(0xFFEA4CC0),
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
      ),
    );
  }
}
