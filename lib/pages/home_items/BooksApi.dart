import 'dart:convert';

//import 'package:dean_institute_mobile_app/model/Courses.dart';
//import 'package:dean_institute_mobile_app/pages/home_items/post_model.dart';
import 'package:http/http.dart' as http;

import 'Courses.dart';

class BooksApi {
  static Future<List<Courses>> getBooks(String query) async {
    final url =
        Uri.parse('https://www.deaninstitute.fastrider.co/api/search-course?');
      // 'https://www.deaninstitute.fastrider.co/api/search-course?
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List books = json.decode(response.body);

      return books.map((json) => Courses.fromJson(json)).where((book) {
        final titleLower = book.slug.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}