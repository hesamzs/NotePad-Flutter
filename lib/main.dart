import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notepad/pages/task_page/todo_list_page.dart';

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
    return MaterialApp(
      title: 'NotePad',
      // home: FirstImage(),
      // home: FirstPage(),
      home: const ToDoListPage(name: ":Dsa"),
      theme: ThemeData(brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
    );
  }
}

// FirstImage() For Final App
// HomePage() For Welcome Page
// FirstPage() For First Page





