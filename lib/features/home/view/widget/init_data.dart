import 'package:flutter/material.dart';

class InitData extends StatelessWidget {
  const InitData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, left: 25, right: 25),
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset(
            'assets/images/find_music.png',
            scale: 3,
          ),
          const SizedBox(
            height: 26,
          ),
          const Text(
            'We have a 100 music in our platfom, find it and save it :)',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
