import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMedicineController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController timesController = TextEditingController();
  
  final isLoading = false.obs;

  void addMedicine() {
    if (nameController.text.isEmpty || 
        quantityController.text.isEmpty || 
        timesController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    final medicine = {
      'name': nameController.text,
      'quantity': quantityController.text,
      'time': timesController.text,
      'taken': false,
    };

    Get.back(result: medicine);
  }

  @override
  void onClose() {
    nameController.dispose();
    quantityController.dispose();
    timesController.dispose();
    super.onClose();
  }
}
