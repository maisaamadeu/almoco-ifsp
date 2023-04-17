import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key,
      this.height = 50,
      this.width = 50,
      this.activeIcon = Icons.check,
      this.disabledIcon,
      this.activeColor = Colors.green,
      this.disabledColor = Colors.red,
      this.borderRadius = 0});

  final double height;
  final double width;
  final IconData activeIcon;
  final IconData? disabledIcon;
  final Color activeColor;
  final Color disabledColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
