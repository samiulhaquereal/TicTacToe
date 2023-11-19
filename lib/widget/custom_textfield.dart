import 'package:flutter/material.dart';
import 'package:tictactoe/utils/color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isReadyOnly;

  const CustomTextField({super.key, required this.controller, required this.hintText, this.isReadyOnly = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 5,
            spreadRadius: 2
          )
        ]
      ),
      child: TextField(
        readOnly: isReadyOnly,
        controller: controller,
        decoration: InputDecoration(
          fillColor: bgColor,
          filled: true,
          hintText: hintText
        ),
      ),
    );
  }
}
