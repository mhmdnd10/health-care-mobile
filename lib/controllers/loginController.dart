import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:healthcareapp/routes/appRoute.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final isLoading=false.obs;

  Future<void> login()async{
    try{
      isLoading.value=true;
      final supabase= Supabase.instance.client;
      final response=await supabase.auth.signInWithPassword(email: email.text, password: password.text);
      final box=GetStorage();
      box.write('user_id', response.user?.id);
      if(response.session !=null){
        Get.offAllNamed(AppRoute.home);
        email.clear();
        password.clear();
      }
      print(response.user);
    }catch(e){
      print('login error ${e.toString()}');
      final errorMessage=e is AuthException ? e.message : 'Something went wrong';

      Get.defaultDialog(
      title: 'Login Failed',
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
