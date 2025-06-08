import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareapp/controllers/medicationController.dart';
import 'package:healthcareapp/routes/appRoute.dart';

class MedicationsView extends StatefulWidget {
  const MedicationsView({super.key});

  @override
  State<MedicationsView> createState() => _MedicationsViewState();
}

class _MedicationsViewState extends State<MedicationsView> {
  MedicationController controller = Get.put(MedicationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Medicines',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Column(
              children: [
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.medicines.length,
                    itemBuilder: (context, index) {
                      final medicine = controller.medicines[index];
                      return ListTile(
                        title: Text(medicine['name']!),
                        subtitle: Text(
                          '${medicine['quantity']}, ${medicine['time']}',
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        ),
                        trailing: Checkbox(
                          value: medicine['taken'],
                          onChanged: (value) {
                            controller.checkMedicine(index, value!);
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Add Medicine'),
                    IconButton(
                      onPressed: () async {
                        final result = await Get.toNamed(AppRoute.addMedicine);
                        if (result != null) {
                          controller.medicines.add(result);
                        }
                      },
                      icon: Icon(Icons.add, size: 30),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {},
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
