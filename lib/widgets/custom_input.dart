import 'package:flutter/material.dart';
import 'package:tcc/default_colors.dart';

class CustomInput extends StatelessWidget {
  const CustomInput(
      {super.key, required this.controller, required this.labelText});

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 350,
      margin: EdgeInsets.only(top: 10),
      child: TextField(
        controller: controller,
        cursorColor: defaultDarkGreen,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: labelText,
          labelStyle: TextStyle(
            color: defaultDarkGreen,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(
              color: defaultDarkGreen,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(
              color: defaultDarkGreen,
            ),
          ),
        ),
      ),
    );
  }
}
