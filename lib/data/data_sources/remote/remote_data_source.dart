import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<Response> loginUser(String email, String password);
}
