import 'package:dean_institute_mobile_app/data/data_sources/remote/remote_data_source.dart';
import 'package:dean_institute_mobile_app/data/data_sources/remote/remote_data_source_impl.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as Getx;

class Repository {
  late RemoteDataSource _remoteDataSource;
  Repository() {
    _remoteDataSource = Getx.Get.put(RemoteDataSourceImpl());
  }

  Future<Response> loginUser(String email, String password) async {
    return _remoteDataSource.loginUser(email, password);
  }
}
