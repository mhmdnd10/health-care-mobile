import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareapp/controllers/homeController.dart';
import 'package:healthcareapp/views/chatView.dart';
import 'package:healthcareapp/views/healthView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.put(HomeController());
  final List pages = [
    HealthView(),
    ChatView(),
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
                    Icons.chat,
                  ),
                  label: 'Chats'),
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
