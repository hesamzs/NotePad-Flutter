class CategoryModel {
  final String title;
  final String description;
  final String imageUrl;
  final int color;
  final int darkcolor;
  final int lightcolor;
  final int logocolor;

  CategoryModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.lightcolor,
    required this.darkcolor,
    required this.color,
    required this.logocolor,
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
    logocolor: 0xff2B4705
  ),
  CategoryModel(
    title: "Study",
    description: "12 notes",
    imageUrl: "assets/images/study-lamp.svg",
    color: 0xff79AE33,
    darkcolor: 0xff548712,
    lightcolor: 0xff96C45A,
    logocolor: 0xff2B4705
  ),
  CategoryModel(
      title: "Study",
      description: "12 notes",
      imageUrl: "assets/images/study-lamp.svg",
      color: 0xff79AE33,
      darkcolor: 0xff548712,
      lightcolor: 0xff96C45A,
      logocolor: 0xff2B4705
  ),


];
