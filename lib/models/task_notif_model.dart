import 'package:flutter/material.dart';

class TaskNotificationModel {
  final String title;
  final String number;
  final IconData logo;

  TaskNotificationModel({
    required this.title,
    required this.number,
    required this.logo,
  });
}

List<TaskNotificationModel> taskNotificationModel = [
  TaskNotificationModel(
    title: "Done",
    number: "15",
    logo: Icons.done,
  ),
  TaskNotificationModel(title: "Pending", number: "2", logo: Icons.pending_actions_sharp,),
  TaskNotificationModel(title: "OnGoing", number: "0", logo: Icons.cancel_outlined,),
];
