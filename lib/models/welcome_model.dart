class WelcomeModel {
  final String title;
  final String description;
  final String imageUrl;
  final double posleft;

  WelcomeModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.posleft,
  });
}

List<WelcomeModel> welcomeComponents = [
  WelcomeModel(
    title: "Create Your Notes Free",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
    imageUrl: "assets/images/1.png",
    posleft: 20,
  ),
  WelcomeModel(
    title: "Set Notifications",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
    imageUrl: "assets/images/2.png",
    posleft: 40,
  ),
  WelcomeModel(
    title: "",
    description: "",
    imageUrl: "assets/images/3.png",
    posleft: 0,
  ),
];
