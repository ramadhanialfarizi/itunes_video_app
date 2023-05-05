import 'package:flutter/material.dart';

class MyMusicEmpty extends StatelessWidget {
  const MyMusicEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, left: 25, right: 25),
      alignment: Alignment.center,
      child: Column(
        children: const [
          Icon(
            Icons.music_note_outlined,
            size: 50,
            color: const Color(0xFFdedede),
          ),
          SizedBox(
            height: 26,
          ),
          Text(
            '''You don't have any music''',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: const Color(0xFFa1a1a1),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
