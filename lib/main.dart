import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:healthcareapp/routes/appPage.dart';
import 'package:healthcareapp/routes/appRoute.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Supabase.initialize(
    url: 'https://snyuieadbifqwkjgsnmr.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNueXVpZWFkYmlmcXdramdzbm1yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDgxMTQxNTEsImV4cCI6MjA2MzY5MDE1MX0.FCFl6YeK2TTR5PVj4XZIdB5aH_jwsWja96SKCub1D7A',
  );

  
  Supabase.instance.client.auth.onAuthStateChange.listen((data) {
    if (data.event == AuthChangeEvent.signedIn) {
      Get.offAllNamed(AppRoute.home);
    } else if (data.event == AuthChangeEvent.signedOut) {
      Get.offAllNamed(AppRoute.login);
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.custom(
      appBuilder: (context, theme) => GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: Supabase.instance.client.auth.currentUser != null ? AppRoute.home : AppRoute.login,
        getPages: AppPage.pages,
      ),
    );
  }
}
