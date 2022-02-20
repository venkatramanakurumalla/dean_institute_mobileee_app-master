import 'package:dean_institute_mobile_app/data/repository/repository.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  late Repository _repository;

  LoginPageController() {
    _repository = Get.find<Repository>();
  }

  RxBool isLoading = false.obs;

  Future<bool> loginUser(String email, String password) async {
    loading(true);
    final result = await _repository.loginUser(email, password);
    loading(false);
    print(result.data.toString());
    if (result.statusCode == 200 || result.statusCode == 201)
      return true;
    else
      return false;
  }

  void loading(bool value) {
    if (isLoading.value != value) {
      isLoading.toggle();
    }
  }
}
