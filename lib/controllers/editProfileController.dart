import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
    TextEditingController name=TextEditingController();
    TextEditingController phone=TextEditingController();
    TextEditingController email=TextEditingController();
    final isLoading= false.obs;
}
  
