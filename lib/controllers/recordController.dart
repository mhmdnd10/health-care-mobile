import 'package:get/get.dart';

class RecordController extends GetxController {
  final genders = ['Male', 'Female'];
  final heights = List.generate(100, (index) => (100 + index).toString());
  final weights = List.generate(100, (index) => (40 + index).toString());
  final ages = List.generate(100, (index) => (index + 1).toString());
  final chronicDiseases = [
    'Cardiovascular diseases',
    'Cancers',
    'Chronic respiratory diseases',
    'Diabetes',
    'Mental health conditions',
    'Other'
        'None',
  ];
  final currentSyptoms = [
    'Pain',
    'Fatigue',
    'Nauesa',
    'Dizziness',
    'Shortness of breath',
    'Night sweats',
    'None',
  ];
  final medications = [
    'Antibiotics',
    'Antivirals',
    'Antifungals',
    'Analgesics',
    'Statinss',
    'Insulin',
    'None',
  ];
  final smokers = [
    'Yes',
    'No',
  ];
  final alcohols = [
    'Yes',
    'No',
  ];
  final bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  final heartRates = List.generate(70, (index) => (70 + index).toString());

  var selectedGender = 'Male'.obs;
  var selectedHeight = "180 cm".obs;
  var selectedWeight = "80 Kg".obs;
  var selectedAge = '20'.obs;
  var selectedDisease = 'Diabetes'.obs;
  var selectedSymptom = 'Pain'.obs;
  var selectedMedication = 'Insulin'.obs;
  var selectedSmoker = 'No'.obs;
  var selectedAlcohol = 'No'.obs;
  var selectedBloodType = 'A+'.obs;
  var selectedHeartRate = '70 bpm'.obs;
  void changeGender(String value) {
    selectedGender.value = value;
  }

  void changeHeight(String value) {
    selectedHeight.value = value;
  }

  void changeWeight(String value) {
    selectedWeight.value = value;
  }

  void changeAge(String value) {
    selectedAge.value = value;
  }

  void changeDisease(String value) {
    selectedDisease.value = value;
  }

  void changeSymptom(String value) {
    selectedSymptom.value = value;
  }

  void changeMedication(String value) {
    selectedMedication.value = value;
  }

  void changeSmoker(String value) {
    selectedSmoker.value = value;
  }

  void changeAlcohol(String value) {
    selectedAlcohol.value = value;
  }

  void changeBloodType(String value) {
    selectedBloodType.value = value;
  }

  void changeHeartRate(String value) {
    selectedHeartRate.value = value;
  }
}
