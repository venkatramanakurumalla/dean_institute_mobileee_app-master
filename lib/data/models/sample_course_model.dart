class SampleCourseModel {
  String courseTitle;
  String courseAuthor;
  double length;
  double price;
  double rating;
  bool isBestSeller;
  String courseImage;
  final String courseGenre = "Tech";

  final String courseDescription =
      "Here, this is a mastery software testing course where you will learn to get the depth look of software and find bugs, improving notes all from scratch. So, if you are a beginner this course is absolutely best for you.";

  SampleCourseModel(
      {required this.courseTitle,
      required this.courseAuthor,
      required this.length,
      required this.price,
      required this.rating,
      this.isBestSeller = false,
      required this.courseImage});
}
