import 'package:get/get.dart';
import 'package:healthcareapp/controllers/chatController.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}
