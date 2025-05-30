import 'package:flutter/material.dart';

class Elevatedbutton extends StatelessWidget {
  Elevatedbutton({
    super.key,
    required this.onPressed,
    required this.backColor,
    required this.foreColor,
    required this.text,
  });
  String text;
  final VoidCallback onPressed;
  Color foreColor;
  Color backColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: foreColor,
          backgroundColor: backColor,
          minimumSize: Size(double.infinity, 50),
        ),
        onPressed: onPressed,
        child: Text(text));
  }
}
