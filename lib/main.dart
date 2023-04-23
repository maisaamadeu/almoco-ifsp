import 'package:flutter/material.dart';
import 'package:tcc/screens/home_student_screen.dart';
import 'package:tcc/screens/login_screen.dart';
import 'package:tcc/screens/splash_screen.dart';
import 'package:tcc/service/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService().initFirebase();
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
