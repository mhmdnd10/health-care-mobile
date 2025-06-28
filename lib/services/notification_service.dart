import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:healthcareapp/routes/appRoute.dart';

class NotificationService{
  static final FirebaseMessaging messaging=FirebaseMessaging.instance;
  static Future<void> init(BuildContext context)async{
    await messaging.requestPermission();
    final token=await messaging.getToken();
    print('fcm token: $token');
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Received a foreground message: ${message.notification?.title}');
        if (message.notification != null) {
          Get.snackbar('Notification', '${message.notification!.title}: ${message.notification!.body}',backgroundColor: Colors.green,colorText: Colors.white);

        }
   });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
          print("Notification clicked (background): ${message.notification?.title}");
          Get.toNamed(AppRoute.home);
      });

     RemoteMessage? initialMessage = await messaging.getInitialMessage();
    if (initialMessage != null) {
      print("Notification clicked (terminated): ${initialMessage.notification?.title}");
      Get.toNamed(AppRoute.home);
    }
   

  }
}