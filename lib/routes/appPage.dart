import 'package:get/get.dart';
import 'package:healthcareapp/bindings/chatBinding.dart';
import 'package:healthcareapp/bindings/forgotPasswordBinding.dart';
import 'package:healthcareapp/bindings/healthBinding.dart';
import 'package:healthcareapp/bindings/homeBinding.dart';
import 'package:healthcareapp/bindings/loginBinding.dart';
import 'package:healthcareapp/bindings/recordBinding.dart';
import 'package:healthcareapp/bindings/registerBinding.dart';
import 'package:healthcareapp/routes/appRoute.dart';
import 'package:healthcareapp/views/chatView.dart';
import 'package:healthcareapp/views/forgotPasswordView.dart';
import 'package:healthcareapp/views/healthView.dart';
import 'package:healthcareapp/views/homeView.dart';
import 'package:healthcareapp/views/loginView.dart';
import 'package:healthcareapp/views/recordsView.dart';
import 'package:healthcareapp/views/registerView.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: AppRoute.register,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoute.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoute.chat,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoute.medicalRecords,
      page: () => RecordsView(),
      binding: RecordBinding(),
    ),
    GetPage(
      name: AppRoute.forgotPassword,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppRoute.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoute.health,
      page: () => HealthView(),
      binding: HealthBinding(),
    ),
  ];
}
