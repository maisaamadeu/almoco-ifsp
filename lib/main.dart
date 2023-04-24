import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tcc/screens/login_screen.dart';
import 'package:tcc/service/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService().initFirebase();
  await initializeDateFormatting('pt_BR');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: LoginScreen(),
    );
  }
}
