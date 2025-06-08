import 'package:get/get.dart';
import 'package:healthcareapp/controllers/donationController.dart';

class DonationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DonationController());
  }
}
