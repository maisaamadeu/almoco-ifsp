import 'package:flutter/material.dart';
import 'package:tcc/default_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackground,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 163,
                width: 163,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 36,
                width: 36,
                child: CircularProgressIndicator(
                  color: defaultGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
