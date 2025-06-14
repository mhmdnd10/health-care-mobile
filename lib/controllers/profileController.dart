import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareapp/routes/appRoute.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileController extends GetxController {
  final isLoading=false.obs;
  final name=''.obs;
  final phone=''.obs;

  Future<void> getUserProfile()async{
    isLoading.value=true;
    try {
      final supabase=Supabase.instance.client;
      final user=supabase.auth.currentUser;
      if(user!=null){
        name.value=user.userMetadata?['name'] ?? 'No Name';
        phone.value=user.userMetadata?['phone_number'] ?? 'No Phone';
      }
      
    } catch (e) {
      Get.snackbar('Error', e.toString(),backgroundColor: Colors.red,colorText: Colors.white);
    }finally{
      isLoading.value=false;
    }

  }

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
