import 'package:get/get.dart';
import 'package:healthcareapp/controllers/healthController.dart';

class HealthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HealthController());
  }
}
