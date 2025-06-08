import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareapp/components/elevatedButton.dart';
import 'package:healthcareapp/controllers/addMedicineController.dart';

class AddMedicineView extends StatefulWidget {
  const AddMedicineView({super.key});

  @override
  State<AddMedicineView> createState() => _AddMedicineViewState();
}

class _AddMedicineViewState extends State<AddMedicineView> {
  AddMedicineController controller = Get.put(AddMedicineController());

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Add Medicine',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField(
              label: 'Medicine Name',
              controller: controller.nameController,
              hint: 'Enter medicine name',
            ),
            SizedBox(height: 20),
            _buildTextField(
              label: 'Quantity',
              controller: controller.quantityController,
              hint: 'Enter quantity (e.g., 2 pills)',
            ),
            SizedBox(height: 20),
            _buildTextField(
              label: 'Times Per Day',
              controller: controller.timesController,
              hint: 'Enter times per day (e.g., 3 times)',
            ),
            Spacer(),
            Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                        strokeWidth: 4,
                      ),
                    )
                  : Elevatedbutton(
                      onPressed: controller.addMedicine,
                      text: 'Add Medicine',
                      foreColor: Colors.white,
                      backColor: Colors.blue,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
