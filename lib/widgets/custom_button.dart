import 'package:flutter/material.dart';
import 'package:tcc/default_colors.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key,
      required this.labelText,
      required this.color,
       this.function});

  final String labelText;
  final Color color;
  final Function()? function;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _isLoading ? 56 : 56,
      width: _isLoading ? 56 : 350,
      child: _isLoading
          ? CircularProgressIndicator(
              color: defaultDarkGreen,
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    350,
                  ),
                ),
              ),
              onPressed: widget.function != null ? () async {
                setState(() {
                  _isLoading = true;
                });
                await widget.function!();
                setState(() {
                  _isLoading = false;
                });
              } : null,
              child: Text(widget.labelText),
            ),
    );
  }
}
