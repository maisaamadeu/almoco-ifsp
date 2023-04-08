import 'package:flutter/material.dart';
import 'package:tcc/kColors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key, required this.controller, required this.hasNull});
  final TextEditingController controller;
  final bool hasNull;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextField(
        textDirection: TextDirection.ltr,
        controller: controller,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          errorText: hasNull ? 'Este campo não pode ficar vazio!' : null,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(
              color: kRed,
              width: 2.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(
              color: kRed,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          labelText: 'Prontuário',
          labelStyle: TextStyle(color: hasNull ? kRed : Colors.white),
        ),
      ),
    );
  }
}
