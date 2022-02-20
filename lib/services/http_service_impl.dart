import 'package:dean_institute_mobile_app/data/data_sources/remote/AuthApi.dart';
import 'package:dean_institute_mobile_app/services/http_service.dart';
import 'package:dean_institute_mobile_app/utility/constants.dart';
import 'package:dio/dio.dart';

class HttpServiceImpl implements HttpService {
  late Dio _dio;
  late AuthApi _authApi;
  @override
  void init() {
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      //FixMe headers: {"Authorization": "Bearer $API_KEY"}
    ));

    _initializeInterceptors();

    _authApi = AuthApi(_dio);
  }

  HttpServiceImpl() {
    init();
  }

  void _initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          print(error.message);
          handler.next(error);
        },
        onRequest: (request, handler) {
          print(
              "Request: ${request.method} : ${request.path} : ${request.data}");
          handler.next(request);
        },
        onResponse: (response, handler) {
          print(
              "Response: ${response.statusCode}: ${response.statusMessage}: ${response.data}");
          handler.next(response);
        },
      ),
    );
  }

  @override
  Future<Response> getResponse(String url) {
    // TODO: implement getResponse
    throw UnimplementedError();
  }

  Future<Response> loginUser(String email, password) {
    return _authApi.loginUser(email, password);
  }
}
