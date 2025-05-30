import 'package:get/get.dart';
import 'package:healthcareapp/controllers/registerController.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
