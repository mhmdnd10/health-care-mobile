import 'package:get/get.dart';
import 'package:healthcareapp/controllers/loginController.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
