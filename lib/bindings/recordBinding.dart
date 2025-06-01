import 'package:get/get.dart';
import 'package:healthcareapp/controllers/recordController.dart';

class RecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecordController());
  }
}
