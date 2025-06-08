import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareapp/components/recordDropDown.dart';
import 'package:healthcareapp/controllers/recordController.dart';

class RecordsView extends StatefulWidget {
  const RecordsView({super.key});

  @override
  State<RecordsView> createState() => _RecordsViewState();
}

class _RecordsViewState extends State<RecordsView> {
  RecordController controller = Get.put(RecordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.close),
        ),
        title: Text(
          'Medical Records',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Let's get started",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "To create your account, we need to confirm some details.",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Obx(() {
                return RecordDropDown(
                  label: 'Sex',
                  selectedValue: controller.selectedGender.value,
                  options: controller.genders,
                  onChanged: controller.changeGender,
                );
              }),
              SizedBox(height: 20),
              Obx(() {
                return RecordDropDown(
                  label: 'Height',
                  selectedValue: controller.selectedHeight.value,
                  options: controller.heights,
                  onChanged: controller.changeHeight,
                );
              }),
              SizedBox(height: 20),
              Obx(() {
                return RecordDropDown(
                  label: 'Weight',
                  selectedValue: controller.selectedWeight.value,
                  options: controller.weights,
                  onChanged: controller.changeWeight,
                );
              }),
              SizedBox(height: 20),
              Obx(() {
                return RecordDropDown(
                  label: 'Age',
                  selectedValue: controller.selectedAge.value,
                  options: controller.ages,
                  onChanged: controller.changeAge,
                );
              }),
              SizedBox(height: 20),
              Obx(() {
                return RecordDropDown(
                  label: 'Chronic diseases',
                  selectedValue: controller.selectedDisease.value,
                  options: controller.chronicDiseases,
                  onChanged: controller.changeDisease,
                );
              }),
              SizedBox(height: 20),
              Obx(() {
                return RecordDropDown(
                  label: 'Current symptoms',
                  selectedValue: controller.selectedSymptom.value,
                  options: controller.currentSyptoms,
                  onChanged: controller.changeSymptom,
                );
              }),
              SizedBox(height: 20),
              Obx(() {
                return RecordDropDown(
                  label: 'Medications',
                  selectedValue: controller.selectedMedication.value,
                  options: controller.medications,
                  onChanged: controller.changeMedication,
                );
              }),
              SizedBox(height: 20),
              Obx(() {
                return RecordDropDown(
                  label: 'Smoker',
                  selectedValue: controller.selectedSmoker.value,
                  options: controller.smokers,
                  onChanged: controller.changeSmoker,
                );
              }),
              SizedBox(height: 20),
              Obx(() {
                return RecordDropDown(
                  label: 'Alcohol',
                  selectedValue: controller.selectedAlcohol.value,
                  options: controller.alcohols,
                  onChanged: controller.changeAlcohol,
                );
              }),
              SizedBox(height: 20),
              Obx(() {
                return RecordDropDown(
                  label: 'Resting heart rate',
                  selectedValue: controller.selectedHeartRate.value,
                  options: controller.heartRates,
                  onChanged: controller.changeHeartRate,
                );
              }),
              SizedBox(height: 20),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  label: Text('Medical notes'),
                  isDense: true,
                  contentPadding: EdgeInsets.all(8),
                  hintText: 'Type important notes about you..',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
