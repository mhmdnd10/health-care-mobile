import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareapp/components/refreshData.dart';
import 'package:healthcareapp/controllers/profileController.dart';
import 'package:healthcareapp/routes/appRoute.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController controller=Get.put(ProfileController());
  @override
  void initState() {
    super.initState();
    controller.getUserProfile();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text('My Profile',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body:RefreshData(onRefresh: ()async{
        controller.getUserProfile();
      },
       child: ListView(
         padding: EdgeInsets.all(12),
          children: [
             Column(
               children: [
                 Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Obx(
                    () => ListTile(
                       title: Text(controller.name.value,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13),),
                       subtitle: Text(controller.phone.value,style: TextStyle(fontSize: 12),),
                       trailing: GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoute.editProfile);
                        },
                         child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(Icons.arrow_forward_ios,color: Colors.white,),),
                       ),
                    ),
                  ),
                 ), 
                 SizedBox(height: 20),
                 _profileItem(icon: Icons.lock, title: 'Change Password',onTap: (){
                  Get.toNamed(AppRoute.changePassword);
                 },),
                 SizedBox(height: 10),
                 Obx(() => controller.isLoading.value ? Center(child: CircularProgressIndicator(color: Colors.green,strokeWidth: 4,),) : _profileItem(icon: Icons.logout, title: 'Logout',onTap: (){
                  controller.logout();
                 },),),
                 
                
               ],
             ),      
            ],
          ),),
       );
      
  }

  Widget _profileItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }){
    return Container(
      
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon,color: Colors.white,)),
        title: Text(title,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13),),
        trailing: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.arrow_forward_ios,color: Colors.white,)),
        ),
      )
    );
  }
}