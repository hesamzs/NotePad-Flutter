import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  final bool isChecked;
  final TextOverflow overflow;

  const AppText({
    super.key,
    required this.text,
    required this.size,
    required this.color,
    required this.fontWeight,
    this.isChecked = false,
    this.overflow = TextOverflow.visible,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: fontWeight,
          decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none,
          decorationColor: const Color(0xff2A135A),
          fontFamily: 'Ubuntu',
          overflow: overflow),
    );
  }
}
