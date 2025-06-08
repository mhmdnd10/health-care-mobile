import 'package:get/get.dart';

class MedicationController extends GetxController {
  final RxList<Map<String, dynamic>> medicines = [
    {
      'name': 'Losartan',
      'quantity': '40mg',
      'time': '1xdaily',
      'taken': false,
    },
    {
      'name': 'Metroprolal',
      'quantity': '50mg',
      'time': '1xdaily',
      'taken': false,
    },
  ].obs;
  var isChecked = false.obs;
  void checkMedicine(int index, bool value) {
    medicines[index]['taken'] = value;
    medicines.refresh();
  }
}
