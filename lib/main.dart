import 'package:flutter/material.dart';
import 'package:tcc/screens/home_student_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeStudentScreen(),
    );
  }
}
