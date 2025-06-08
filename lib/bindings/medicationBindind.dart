import 'package:get/get.dart';
import 'package:healthcareapp/controllers/medicationController.dart';

class MedicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedicationController());
  }
}
