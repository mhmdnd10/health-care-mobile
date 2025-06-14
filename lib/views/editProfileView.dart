import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareapp/components/elevatedButton.dart';
import 'package:healthcareapp/controllers/editProfileController.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  EditProfileController controller = Get.put(EditProfileController());
  @override
  void initState() {
    super.initState();
    controller.loadUserData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Edit Profile',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _profileItem(icon: Icons.person,controller: controller.name,),
          SizedBox(height: 20,),
          _profileItem(icon: Icons.email,controller: controller.email,),
          SizedBox(height: 20,),
          _profileItem(icon: Icons.phone,controller: controller.phone,),
          SizedBox(height: 20,),
          Obx(
            () => controller.isLoading.value ? Center(child: CircularProgressIndicator(color: Colors.green,strokeWidth: 4,),) : Elevatedbutton(onPressed: (){
              controller.editProfile();
            }, text: 'Save',foreColor: Colors.white,backColor: Colors.blue,),
          ),
        ],
      ),),
    );
  }
}

Widget _profileItem({required IconData icon,required TextEditingController controller}){
  return TextField(
          controller: controller,
        
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            isDense: true,
            
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(12)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(12)
            ),
             suffixIcon: Icon(icon,color: Colors.grey,),
              
            ),
          );
}