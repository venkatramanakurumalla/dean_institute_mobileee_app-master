import 'package:dean_institute_mobile_app/data/data_sources/remote/remote_data_source.dart';
import 'package:dean_institute_mobile_app/services/http_service.dart';
import 'package:dean_institute_mobile_app/services/http_service_impl.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as Getx;

class RemoteDataSourceImpl extends RemoteDataSource {
  late HttpService _httpService;

  RemoteDataSourceImpl() {
    _httpService = Getx.Get.put(HttpServiceImpl());
  }

  @override
  Future<Response> loginUser(String email, String password) {
    // TODO: implement loginUser
    return _httpService.loginUser(email, password);
  }
}
