import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareapp/components/Textfield.dart';
import 'package:healthcareapp/components/elevatedButton.dart';
import 'package:healthcareapp/controllers/forgotPasswordController.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  ForgotPasswordController controller = Get.put(ForgotPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              'Forgot Password?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
                "Enter your email address and we'll send you a link to reset your password."),
            SizedBox(height: 20),
            Textfield(
              hintText: 'enter you email',
              label: 'Email',
              controller: controller.email,
              inputType: TextInputType.emailAddress,
              obsqureText: false,
            ),
            SizedBox(height: 15),
            Obx(
              () =>controller.isLoading.value? CircularProgressIndicator(color: Colors.green,strokeWidth:4 ,): Elevatedbutton(
                  onPressed: () {
                    controller.forgotPassword();
                  },
                  backColor: Colors.blue,
                  foreColor: Colors.white,
                  text: 'Send Reset Link'),
            ),
          ],
        ),
      ),
    );
  }
}
