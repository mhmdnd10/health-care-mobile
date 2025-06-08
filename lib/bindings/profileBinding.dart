import 'package:get/get.dart';
import 'package:healthcareapp/controllers/profileController.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}