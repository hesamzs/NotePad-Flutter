import 'package:hive/hive.dart';

part 'categoriesDB.g.dart';

@HiveType(typeId: 1)
class CategoryDB {
  @HiveField(0)
  Map categoryTitle;


  CategoryDB({
    required this.categoryTitle,
  });
}

