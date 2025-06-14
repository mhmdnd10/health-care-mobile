import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfileController extends GetxController {
    TextEditingController name=TextEditingController();
    TextEditingController phone=TextEditingController();
    TextEditingController email=TextEditingController();
    final isLoading= false.obs;
    Future<void> loadUserData() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user != null) {
      name.text = user.userMetadata?['name'] ?? 'No name';
      phone.text = user.userMetadata?['phone_number'] ?? 'No phone';
      email.text = user.email ?? 'No email';
    }
}
    Future<void> editProfile()async{
      isLoading.value=true;
      try{
        await Supabase.instance.client.auth.updateUser(
          UserAttributes(
            email: email.text,
            data: {
              'name':name.text,
              'phone_number':phone.text,
            }
          ),
        );
        
        Get.snackbar('Success', 'Profile updated successfully',backgroundColor: Colors.green,colorText: Colors.white);
      } on DioException catch(e){
        Get.snackbar('Error', e.response?.data['message'],backgroundColor: Colors.red,colorText: Colors.white);
      }finally{
        isLoading.value=false;
      }
    }
}
