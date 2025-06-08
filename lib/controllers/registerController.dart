import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareapp/routes/appRoute.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  final isLoading= false.obs;
  Future<void> register() async{
    try{
      isLoading.value=true;
      final supabase= Supabase.instance.client;
      final response = await supabase.auth.signUp(
        email: email.text,
        password: password.text,
        data: {
          'name': name.text,
          'phone_number': phone.text
        }
      );
      
      final user = response.user;
      print(user);
      
      if (user != null) {
        // Show success dialog
        Get.defaultDialog( 
          title: 'Success',
          content: Column(
            children: [
              Image.asset('assets/success.png'),
              SizedBox(height: 20),
              Text('User registered successfully. Please check your email to confirm your account.'),
            ],
          ),
          onConfirm: () {
            Get.offAndToNamed(AppRoute.login);
            name.clear();
            email.clear();
            phone.clear();
            password.clear();
          },
        );
      }
    } catch (e) {
      print('register error ${e.toString()}');
      String errorMessage;
      if (e is AuthException) {
        errorMessage = e.message;
      } else if (e is PostgrestException) {
        errorMessage = e.message;
      } else {
        errorMessage = 'Something went wrong';
      }
      Get.defaultDialog(
        title: 'Registration Failed',
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
    } finally {
      isLoading.value = false;
    }
  }
}
