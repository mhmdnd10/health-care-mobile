import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:healthcareapp/services/dio_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatController extends GetxController {
  TextEditingController content = TextEditingController();
  final isLoading=false.obs;
  final RxList<Map<String,String>> messages=<Map<String,String>>[].obs;
  final sessionId = RxnString(null);

  // final List<Map<String, String>> messages = [
  //   {'sender': 'bot', 'text': 'Hi, how can I help you today?'},
  //   {'sender': 'me', 'text': 'I have been experiencing headaches lately.'},
  //   {'sender': 'bot', 'text': 'I see, do you have any other symptoms?'},
  //   {'sender': 'me', 'text': 'I also felt nauseous a couple of times.'},
  // ].obs;

  // void sendMessage(String text) {
  //   if (text.trim().isEmpty) {
  //     return;
  //   }
  //   messages.add({
  //     'sender': 'me',
  //     'text': text.trim(),
  //   });
  // }
  Future<void> sendMessage()async{
     if(content.text.trim().isEmpty){
      return;
     }
     messages.add({
       'type':'user',
       'text':content.text,
     });
      isLoading.value=true;
      try{
        final box=GetStorage();
        final user_id=box.read('user_id');
       
        final response=await ApiClient.dio.post('/chatbot/message/?action=message',data:{
          'sent_message':content.text,
          'user_id':user_id,
          'session_id':sessionId.value,
        });
        sessionId.value=response.data['session_id'];
        final botReply=response.data['response']?.toString()??'';
        print('bot replied: $botReply');
        messages.add({
          'type':'bot',
          'text':botReply,
        });
        content.clear();
        print('message sent successfully');
        
        await Future.delayed(Duration(milliseconds: 500));
        await getChats();
      } on DioException catch(e){
        Get.snackbar('Error', e.toString());
      }finally{
        isLoading.value=false;
      }
  }


Future<void> getChats()async{
  isLoading.value=true;
  messages.clear();
  try{
    final box = GetStorage();
    final user_id = box.read('user_id');
   final supabase=Supabase.instance.client;
   final response=await supabase
   .from('chats')
   .select('sent_message,response_message,session_id')
   .eq('user_id_fk',user_id)
   .order('created_at',ascending: true);
   for (final row in response) {
     final userMsg = row['sent_message'];
      final botMsg = row['response_message'];
      final session = row['session_id'];

      if (userMsg != null) {
        messages.add({
          'type': 'user',
          'text': userMsg,
        });
      }

      if (botMsg != null) {
        messages.add({
          'type': 'bot',
          'text': botMsg,
        });
      }

    
      sessionId.value ??= session;
    //  messages.value = messages.reversed.toList();
    }
   
  }catch(e){
    Get.snackbar('Error', e.toString(),backgroundColor: Colors.red,colorText: Colors.white);
  }finally{
    isLoading.value=false;
  }
}

}
