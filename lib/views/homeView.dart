import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareapp/controllers/homeController.dart';
import 'package:healthcareapp/views/chatView.dart';
import 'package:healthcareapp/views/donationsView.dart';
import 'package:healthcareapp/views/healthView.dart';
import 'package:healthcareapp/views/medicationsView.dart';
import 'package:healthcareapp/views/profileView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.put(HomeController());
  final List pages = [
    HealthView(),
    MedicationsView(),
    DonationsView(),
    ChatView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[controller.currentIndex.value],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -1),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeView,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_outline,
                ),
                label: 'Health',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.medical_information,
                ),
                label: 'Medications',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.bloodtype,
                ),
                label: 'Blood Donations',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat,
                  ),
                  label: 'Chats'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profile'),
            ],
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconSize: 30,
            unselectedFontSize: 12,
            selectedFontSize: 15,
            unselectedLabelStyle: TextStyle(color: Colors.blue),
            unselectedItemColor: Colors.blue,
            selectedItemColor: Colors.black87,
            selectedLabelStyle:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
