import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
  TextEditingController currentPassword=TextEditingController();
  TextEditingController newPassword=TextEditingController();
  TextEditingController confirmPassword=TextEditingController();

  RxBool currentPasswordObscured = true.obs;
  RxBool newPasswordObscured = true.obs;
  RxBool confirmPasswordObscured = true.obs;
  var obscureText= false.obs;
  final isLoading= false.obs;
}