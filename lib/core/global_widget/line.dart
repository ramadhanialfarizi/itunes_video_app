import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  final String text;
  final String textPosition;
  final double height;
  final Color color;
  const Line({
    Key? key,
    this.text = '',
    this.textPosition = 'center',
    this.height = 1,
    this.color = const Color(0xFFF44E42),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (text != '') {
      return Row(
        children: [
          if (textPosition == 'left') ...[
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFFF44E42),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Container(
                height: 1,
                color: color,
              ),
            ),
          ] else if (textPosition == 'center') ...[
            Expanded(
              flex: 1,
              child: Container(
                height: 1,
                color: color,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Container(
                height: 1,
                color: color,
              ),
            ),
          ] else if (textPosition == 'right') ...[
            Expanded(
              flex: 1,
              child: Container(
                height: 1,
                color: color,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFFF44E42),
              ),
            ),
          ]
        ],
      );
    } else {
      return Container(height: height, color: color);
    }
  }
}
