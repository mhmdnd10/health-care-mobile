import 'package:get/get.dart';
import 'package:healthcareapp/controllers/homeController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
