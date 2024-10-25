import 'package:flutter/material.dart';

import '../pages/task_page/notes_page.dart';
import '../pages/task_page/reminder_page.dart';
import '../pages/task_page/stopwatch_page.dart';
import '../pages/task_page/todo_list_page.dart';

class TaskTypeModel {
  final String title;
  final int id;
  final IconData logo;
  final dynamic className;

  TaskTypeModel({
    required this.title,
    required this.id,
    required this.logo,
    required this.className,
  });
}

List<TaskTypeModel> taskTypeModel = [
  TaskTypeModel(
    title: "To-Do List",
    id: 0,
    logo: Icons.check_box_outlined,
    className: const ToDoListPage(name: "To-Do List"),
  ),
  TaskTypeModel(
    title: "Stopwatch",
    id: 1,
    logo: Icons.timer_outlined,
    className: const StopwatchPage(),
  ),
  TaskTypeModel(
    title: "Reminder",
    id: 2,
    logo: Icons.notification_add_outlined,
    className: const ReminderPage(
      pageName: 'Reminder',
    ),
  ),
  TaskTypeModel(
    title: "Notes",
    id: 3,
    logo: Icons.note_add_outlined,
    className: const NotesPage(),
  ),
];
