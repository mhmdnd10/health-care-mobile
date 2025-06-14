import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://seniorproject-production-bbe6.up.railway.app",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ),
    
  )..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final box=GetStorage();
        final token=box.read('token');
        if(token!=null){
          options.headers['Authorization']="Bearer $token";
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) {
        print('Dio error: ${e.response?.data}');
        return handler.next(e);
      },
    ),
  );

}