import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChangePasswordController extends GetxController{
  TextEditingController newPassword=TextEditingController();
  TextEditingController confirmPassword=TextEditingController();

  RxBool newPasswordObscured = true.obs;
  RxBool confirmPasswordObscured = true.obs;
  var obscureText= false.obs;
  final isLoading= false.obs;
  Future<void> changePassword()async{
    isLoading.value=true;
    try {
      final supabase=Supabase.instance.client;
      final user=supabase.auth.currentUser;
      if(user!=null){
           if(newPassword.text!=confirmPassword.text){
          Get.snackbar('Error', 'Passwords do not match',backgroundColor: Colors.red,colorText: Colors.white);
          return;
        }
        final response=await supabase.auth.updateUser(
          UserAttributes(
            password: newPassword.text,
          ),
        );
     
        newPassword.clear();
        confirmPassword.clear();
        Get.snackbar('Success', 'Password changed successfully',backgroundColor: Colors.green,colorText: Colors.white);
      
      }
    }on DioException catch (e) {
      Get.snackbar('Error', e.response?.data['message'],backgroundColor: Colors.red,colorText: Colors.white);
    }finally{
      isLoading.value=false;
    }
  }
}