import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tcc/kColors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key, required this.labelText, required this.functionButton});
  final String labelText;
  final Function() functionButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kRed,
        minimumSize: Size(MediaQuery.of(context).size.width, 70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      onPressed: functionButton,
      child: Text(
        labelText,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
