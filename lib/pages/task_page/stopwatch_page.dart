import 'package:flutter/material.dart';

import '../../widget/taskpage_appbar_widget.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
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
