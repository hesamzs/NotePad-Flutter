import 'package:flutter/material.dart';
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
      home:  FirstImage(),
      debugShowCheckedModeBanner: false,
    );
  }

}
// FirstImage() For Final App
// HomePage() For Welcome Page
// FirstPage() For First Page

