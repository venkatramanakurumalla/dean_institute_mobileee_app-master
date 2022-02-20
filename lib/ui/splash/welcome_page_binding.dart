import 'package:dean_institute_mobile_app/data/repository/repository.dart';
import 'package:get/get.dart';

class WelcomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(new Repository());
  }
}
