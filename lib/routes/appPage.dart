import 'package:get/get.dart';
import 'package:healthcareapp/bindings/changePasswordBinding.dart';
import 'package:healthcareapp/bindings/chatBinding.dart';
import 'package:healthcareapp/bindings/donationBinding.dart';
import 'package:healthcareapp/bindings/editProfileBinding.dart';
import 'package:healthcareapp/bindings/addMedicineBinding.dart';
import 'package:healthcareapp/bindings/forgotPasswordBinding.dart';
import 'package:healthcareapp/bindings/healthBinding.dart';
import 'package:healthcareapp/bindings/homeBinding.dart';
import 'package:healthcareapp/bindings/loginBinding.dart';
import 'package:healthcareapp/bindings/medicationBindind.dart';
import 'package:healthcareapp/bindings/profileBinding.dart';
import 'package:healthcareapp/bindings/recordBinding.dart';
import 'package:healthcareapp/bindings/registerBinding.dart';
import 'package:healthcareapp/routes/appRoute.dart';
import 'package:healthcareapp/views/changePasswordView.dart';
import 'package:healthcareapp/views/chatView.dart';
import 'package:healthcareapp/views/donationsView.dart';
import 'package:healthcareapp/views/editProfileView.dart';
import 'package:healthcareapp/views/addMedicineView.dart';
import 'package:healthcareapp/views/forgotPasswordView.dart';
import 'package:healthcareapp/views/healthView.dart';
import 'package:healthcareapp/views/homeView.dart';
import 'package:healthcareapp/views/loginView.dart';
import 'package:healthcareapp/views/medicationsView.dart';
import 'package:healthcareapp/views/profileView.dart';
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
    GetPage(
      name: AppRoute.medications,
      page: () => MedicationsView(),
      binding: MedicationBinding(),
    ),
    GetPage(
      name: AppRoute.donations,
      page: () => DonationsView(),
      binding: DonationBinding(),
    ),
    GetPage(
      name: AppRoute.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoute.changePassword,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: AppRoute.editProfile,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: AppRoute.addMedicine,
      page: () => AddMedicineView(),
      binding: AddMedicineBinding(),
    ),
  ];
}
