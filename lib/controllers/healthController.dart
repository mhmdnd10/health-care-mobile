import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:healthcareapp/services/dio_client.dart';

class HealthController extends GetxController {
  RxList<PlatformFile> pickedFiles=<PlatformFile>[].obs;
RxList<Map<String, String>> uploadedFiles = <Map<String, String>>[].obs;

  final isLoading=false.obs;
  @override
  void onInit() {
    super.onInit();
    getReports();
  }

  Future<void> uploadFile()async{
    isLoading.value=true;
    try {
      final box=GetStorage();
      final user_id=box.read('user_id');
       FilePickerResult? result=await FilePicker.platform.pickFiles(
      type:FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if(result!=null && result.files.isNotEmpty){
      pickedFiles.insertAll(0, result.files);


    }
      final filePath = pickedFiles.first.path!;
      final fileName = pickedFiles.first.name;
      final formData = dio.FormData.fromMap({ 
          'user_id': user_id,
          'action': 'upload',
          'file': await dio.MultipartFile.fromFile(filePath, filename: fileName),
        });
      final response=await ApiClient.dio.post('/documents/reports?action=upload&user_id=$user_id',data:formData);
      print('upload: ${response.data}');      
      await getReports();
    } catch (e) {
      final errorMessage=e is dio.DioException ? e.response?.data['message'] : 'Something went wrong';
      Get.snackbar('Error', errorMessage);
    }finally{
      isLoading.value=false;
    }
  }
  Future<void> getReports()async{
    isLoading.value=true;
    try {
      final box=GetStorage();
      final user_id=box.read('user_id');
      final response=await ApiClient.dio.get('/documents/reports?action=user_documents&user_id=$user_id');
  
      final documents = response.data['documents'] as List;
            final files = documents.map((doc) => {
      'file_name': doc['file_name'].toString(),
      'file_url': doc['file_url'].toString(),
    }).toList();
     
      uploadedFiles.assignAll(files);
    
      print('reports: ${response.data}');      
    } catch (e) {
      final isNoDocs = e is dio.DioException &&
                     e.response?.data['message'] == 'No documents found for this user';

    if (!isNoDocs) {
      final errorMessage = e is dio.DioException
          ? e.response?.data['message']
          : 'Something went wrong';
      Get.snackbar('Error', errorMessage);
    }
    }finally{
      isLoading.value=false;
    }
  }




  

}
