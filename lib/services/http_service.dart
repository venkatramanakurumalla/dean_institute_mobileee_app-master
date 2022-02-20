import 'package:dio/dio.dart';

abstract class HttpService {
  void init();

  Future<Response> getResponse(String url);
  Future<Response> loginUser(String email, String password);
}
