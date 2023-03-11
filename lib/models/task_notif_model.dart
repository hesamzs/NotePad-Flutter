import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskNofifModel {
  final String title;
  final String number;
  final IconData logo;


  TaskNofifModel({
    required this.title,
    required this.number,
    required this.logo,

  });
}

List<TaskNofifModel> tasknotifModel = [
  TaskNofifModel(
      title: "Done",
      number: "15",
      logo: Icons.done,
  ),
  TaskNofifModel(
      title: "Pending",
      number: "2",
      logo: Icons.pending_actions_sharp
  ),
  TaskNofifModel(
      title: "OnGoing",
      number: "0",
      logo: Icons.cancel_outlined
  ),
];
