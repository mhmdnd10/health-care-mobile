import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController email = TextEditingController();
  final isLoading=false.obs;
  Future<void> forgotPassword()async{
    isLoading.value=true;
    try{
      final supabase=Supabase.instance.client;
      final response=await supabase.auth.resetPasswordForEmail(email.text);
      Get.defaultDialog(
        title: 'Success',
        content: Column(
          children: [
            Image.asset('assets/success.png'),
            SizedBox(height: 20),
            Text('Check your email for a reset link.'),
          ],
        ),
        onConfirm: () {
          Get.back();
          email.clear();
        },
      );
    }catch(e){
      String errorMessage;
      if (e is AuthException) {
        errorMessage = e.message;
      } else if (e is PostgrestException) {
        errorMessage = e.message;
      } else {
        errorMessage = 'Something went wrong';
      }
      Get.defaultDialog(
        title: 'Error',
        content: Column(
          children: [
            Image.asset('assets/error.png'),
            SizedBox(height: 20),
            Text(errorMessage),
          ],
        ),
        onConfirm: () {
          Get.back();
        },
      );
    }finally{
      isLoading.value=false;
    }
  }

}
