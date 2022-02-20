import 'package:dean_institute_mobile_app/ui/auth/login/login_page_controller.dart';
import 'package:get/get.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginPageController());
  }
}
