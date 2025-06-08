import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareapp/routes/appRoute.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileController extends GetxController {
  final isLoading=false.obs;

  Future<void> logout()async{
    isLoading.value=true;
    try {
      final supabase=Supabase.instance.client;
      await supabase.auth.signOut();
      Get.offAllNamed(AppRoute.login);
    } catch (e) {
      Get.snackbar('Logout Failed', e.toString(),backgroundColor: Colors.red,colorText: Colors.white);
    }finally{
      isLoading.value=false;
    }

  }
  
}
