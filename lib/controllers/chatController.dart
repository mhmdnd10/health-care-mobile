import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  TextEditingController content = TextEditingController();
  final List<Map<String, String>> messages = [
    {'sender': 'bot', 'text': 'Hi, how can I help you today?'},
    {'sender': 'me', 'text': 'I have been experiencing headaches lately.'},
    {'sender': 'bot', 'text': 'I see, do you have any other symptoms?'},
    {'sender': 'me', 'text': 'I also felt nauseous a couple of times.'},
  ].obs;

  void sendMessage(String text) {
    if (text.trim().isEmpty) {
      return;
    }
    messages.add({
      'sender': 'me',
      'text': text.trim(),
    });
  }
}
