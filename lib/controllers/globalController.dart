import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:healthcareapp/routes/appRoute.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GlobalController extends GetxController {
  final isLoading=false.obs;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email'],
    serverClientId: '672619363847-jmh489vprpkql3403bl4pm9m62va2tu3.apps.googleusercontent.com',
    signInOption: SignInOption.standard,
    forceCodeForRefreshToken: true,
  );
  Future<void> signInwithGoogle()async{   
    isLoading.value=true;
    try {
      await googleSignIn.signOut();
      final googleUser=await googleSignIn.signIn();
      if (googleUser == null) {
        isLoading.value=false;
        return;
      }

      final googleAuth=await googleUser.authentication;
      final idToken=googleAuth.idToken;
      if (idToken == null) {
        throw Exception("Failed to retrieve ID token.");
      }
      final res = await Supabase.instance.client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
      );
      Get.offAllNamed(AppRoute.home);
} catch (e) {
  print( 'google sign in error ${e.toString()}');
  Get.defaultDialog(
    title: 'Login Failed',
    content: Column(
      children: [
      Image.asset('assets/error.png'),
        SizedBox(height: 20),
        Text(e.toString()),
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
