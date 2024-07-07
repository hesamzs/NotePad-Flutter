import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  final bool isChecked;

  const AppText({
    required this.text,
    required this.size,
    required this.color,
    required this.fontWeight,
    this.isChecked = false,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: GoogleFonts.ubuntu(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
        decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        decorationColor: const Color(0xff2A135A),
      ),
    );
  }
}
