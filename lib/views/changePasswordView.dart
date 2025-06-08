import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareapp/components/elevatedButton.dart';
import 'package:healthcareapp/controllers/changePasswordController.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  ChangePasswordController _controller = Get.put(ChangePasswordController());
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Change Password',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
           _changePasswordItem(
             title: 'Current Password',
             controller: _controller.currentPassword,
             hintText: 'Current Password',
             obscured: _controller.currentPasswordObscured
           ),
           SizedBox(height: 20),
        
           _changePasswordItem(
             title: 'New Password',
             controller: _controller.newPassword,
             hintText: 'New Password',
             obscured: _controller.newPasswordObscured
           ),
           SizedBox(height: 20),
           _changePasswordItem(
             title: 'Confirm Password',
             controller: _controller.confirmPassword,
             hintText: 'Confirm Password',
             obscured: _controller.confirmPasswordObscured
           ),
            SizedBox(height: 40),

            Elevatedbutton(onPressed: (){}, text: 'Confirm',foreColor: Colors.white,backColor: Colors.blue,),
          ],
        ),
      ),
    );
  }

  Widget _changePasswordItem({
    required String title,
    required TextEditingController controller,
    required String hintText,
    required RxBool obscured
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Obx(() => TextField(
          controller: controller,
          obscureText: obscured.value,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            isDense: true,
            
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey,fontSize: 12,),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(12)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(12)
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  obscured.value = !obscured.value;
                },
                icon: Icon(
                  obscured.value ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                )
              ),
            ),
          ),
          
        ),
      ],
    );
  }
}