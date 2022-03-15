class Courses {
  final int id;
  //final String category_name;
  //final String category_logo;
  final String slug;

  const Courses({
    required this.id,
   // required this.category_name,
   // required this.category_logo,
    required this.slug
  });

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
        id: json['id'],
       // category_name: json['category_name'],
       // category_logo: json['category_logo'],
        slug: json['slug'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
       // 'title': category_name,
        //'urlImage': category_logo,
        'author': slug,
      };
}