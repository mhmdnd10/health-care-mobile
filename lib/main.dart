import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareapp/routes/appPage.dart';
import 'package:healthcareapp/routes/appRoute.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoute.register,
      getPages: AppPage.pages,
    );
  }
}
