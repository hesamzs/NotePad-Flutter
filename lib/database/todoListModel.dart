import 'package:hive/hive.dart';

part 'todoListModel.g.dart';

@HiveType(typeId: 1)
class TodoListModelHive {
  @HiveField(0)
  String title;

  @HiveField(1)
  bool isChecked;

  @HiveField(2)
  String date;

  TodoListModelHive({
    required this.title,
    required this.isChecked,
    required this.date,
  });
}