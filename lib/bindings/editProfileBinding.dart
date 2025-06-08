import 'package:get/get.dart';
import 'package:healthcareapp/controllers/editProfileController.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>EditProfileController());
  }
 
}