import 'package:flutter/material.dart';
import 'package:notepad/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'NotePad',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


