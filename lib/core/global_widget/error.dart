import 'package:flutter/material.dart';

class ErrorData extends StatelessWidget {
  const ErrorData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, left: 25, right: 25),
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset(
            'assets/images/404_not_found.jpeg',
            scale: 3,
          ),
          const SizedBox(
            height: 26,
          ),
          const Text(
            'Failed to get data :( please check your connection and reload the app',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
