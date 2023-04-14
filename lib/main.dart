import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:tcc/controller/controller.dart';
import 'package:tcc/pages/login_page.dart';
import 'package:tcc/pages/select_login_page.dart';
import 'package:tcc/pages/students/home_students_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "dev project",
    options: FirebaseOptions(
      apiKey: "AIzaSyAY9aAoJrUkUx2TwsEb9oH6sJptmonOCKE",
      appId: "1:423528113901:web:514257ecaf727190c20ee4",
      messagingSenderId: "423528113901",
      projectId: "tcc-ifsp-btv",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase',
      home: ChangeNotifierProvider(
        child: LoginPage(),
        create: (context) => Controller(),
      ),
    );
  }
}
