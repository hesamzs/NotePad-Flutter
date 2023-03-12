
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTypeModel {
  final String title;
  final int id;
  final IconData logo;


  TaskTypeModel({
    required this.title,
    required this.id,
    required this.logo,

  });
}

List<TaskTypeModel> taskTypeModel = [
  TaskTypeModel(
    title: "To-Do List",
    id: 0,
    logo: Icons.check_box_outlined,
  ),
  TaskTypeModel(
    title: "Stopwatch",
    id: 1,
    logo: Icons.timer_outlined,
  ),
  TaskTypeModel(
    title: "Reminder",
    id: 2,
    logo: Icons.notification_add_outlined,
  ),
  TaskTypeModel(
    title: "Notes",
    id: 3,
    logo: Icons.note_add_outlined,
  ),

];
