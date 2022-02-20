import 'package:dio/dio.dart';

class AuthApi {
  //End Points
  String _loginEndpoint = "login";

  final Dio _dio;
  AuthApi(this._dio);

  Future<Response> loginUser(String email, String password) async {
    final response = await _dio.post(
      _loginEndpoint,
      data: {"email": email, "password": password},
    );
    return response;
  }
}
