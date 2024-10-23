import 'dart:math' as math;

class CategoryModel {
  final String title;
  final String description;
  final String imageUrl;
  final int color;
  final int darkColor;
  final int lightColor;
  final int logoColor;
  final double rotate;

  CategoryModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.lightColor,
    required this.darkColor,
    required this.color,
    required this.logoColor,
    required this.rotate,
  });
}

List<CategoryModel> categoryComponents = [
  CategoryModel(
    title: "Study",
    description: "12 notes",
    imageUrl: "assets/images/study-lamp.svg",
    color: 0xff79AE33,
    darkColor: 0xff548712,
    lightColor: 0xff96C45A,
    logoColor: 0xff2B4705,
    rotate: math.pi
  ),
  CategoryModel(
    title: "Work",
    description: "6 notes",
    imageUrl: "assets/images/work-case.svg",
    color: 0xff33AEAA,
    darkColor: 0xff168885,
    lightColor: 0xff55EEEA,
    logoColor: 0xff164847,
    rotate: 0
  ),
  CategoryModel(
      title: "Movie",
      description: "1 note",
      imageUrl: "assets/images/movie-icon.svg",
      color: 0xff9356B4,
      darkColor: 0xff78319F,
      lightColor: 0xffB388CB,
      logoColor: 0xff3C0F56,
      rotate: 0
  ),
  CategoryModel(
      title: "Exercise",
      description: "0 note",
      imageUrl: "assets/images/exercise.svg",
      color: 0xffCC8431,
      darkColor: 0xffB4670F,
      lightColor: 0xffF5A952,
      logoColor: 0xff562E00,
      rotate: math.pi
  ),



];
