import 'package:get/get.dart';
import 'package:healthcareapp/controllers/addMedicineController.dart';

class AddMedicineBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddMedicineController());
  }
}
