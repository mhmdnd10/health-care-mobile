import 'package:get/get.dart';
import 'package:healthcareapp/controllers/forgotPasswordController.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordController());
  }
}
