import 'dart:math' as math;

class CategoryModel {
  final String title;
  final String description;
  final String imageUrl;
  final int color;
  final int darkcolor;
  final int lightcolor;
  final int logocolor;
  final double rotate;

  CategoryModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.lightcolor,
    required this.darkcolor,
    required this.color,
    required this.logocolor,
    required this.rotate,
  });
}

List<CategoryModel> categoryComponents = [
  CategoryModel(
    title: "Study",
    description: "12 notes",
    imageUrl: "assets/images/study-lamp.svg",
    color: 0xff79AE33,
    darkcolor: 0xff548712,
    lightcolor: 0xff96C45A,
    logocolor: 0xff2B4705,
    rotate: math.pi
  ),
  CategoryModel(
    title: "Work",
    description: "6 notes",
    imageUrl: "assets/images/work-case.svg",
    color: 0xff33AEAA,
    darkcolor: 0xff168885,
    lightcolor: 0xff55EEEA,
    logocolor: 0xff164847,
    rotate: 0
  ),
  CategoryModel(
      title: "Movie",
      description: "1 note",
      imageUrl: "assets/images/movie-icon.svg",
      color: 0xff9356B4,
      darkcolor: 0xff78319F,
      lightcolor: 0xffB388CB,
      logocolor: 0xff3C0F56,
      rotate: 0
  ),


];
