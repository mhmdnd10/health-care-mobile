import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  Textfield({
    super.key,
    required this.hintText,
    required this.label,
    required this.controller,
    required this.inputType,
    required this.obsqureText,
  });
  String hintText;
  String label;
  TextEditingController controller;
  TextInputType inputType;
  bool obsqureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsqureText,
      keyboardType: inputType,
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
