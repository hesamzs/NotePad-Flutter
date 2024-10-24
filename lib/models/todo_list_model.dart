import 'package:hive/hive.dart';

part 'todo_list_model.g.dart';
@HiveType(typeId: 2)
class ToDoListModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  bool isChecked;
  @HiveField(2)
  final String date;

  ToDoListModel({
    required this.title,
    required this.isChecked,
    required this.date,
  });
}