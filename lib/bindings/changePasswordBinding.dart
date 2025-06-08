import 'package:get/get.dart';
import 'package:healthcareapp/controllers/changePasswordController.dart';

class ChangePasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>ChangePasswordController());
  }
}
  