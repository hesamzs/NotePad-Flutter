import 'package:flutter/material.dart';

import '../../widget/taskpage_appbar_widget.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              taskPageAppbar("Soon", context, []),
            ],
          ),
        ),
      ),
    );
  }
}
