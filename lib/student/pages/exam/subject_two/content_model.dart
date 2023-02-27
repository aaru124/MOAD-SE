class UnbordingContent {
  String image;
  String title;
  String description;

  UnbordingContent(
      {required this.image, required this.title, required this.description});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'PRACTICE EXAM',
      image: 'assets/logo.png',
      description:
          "1.All questions are compulsory.\n2.You are allowed to choose your answer only once.\n3.Make sure you answer correctly before submitting."),
  /*UnbordingContent(
      title: 'Fast Delivery',
      image: 'images/delevery.svg',
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
  UnbordingContent(
      title: 'Reward surprises',
      image: 'images/reward.svg',
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),*/
];
