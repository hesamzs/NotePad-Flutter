import 'package:flutter/material.dart';
import 'package:notepad/pages/first_page.dart';
import 'package:flutter/services.dart';
import 'package:notepad/pages/welcome_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'NotePad',
      home: FirstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// HomePage() For Final App
// FirstImage() For Image Logo Page
// FirstPage() For First Page
