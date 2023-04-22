import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tcc/screens/home_employee_screen.dart';
import 'package:tcc/screens/home_student_screen.dart';

enum UserType { student, employee }

class FirebaseService {
  Future<void> initFirebase() async {
    await Firebase.initializeApp();
  }

  Future<void> login({
    required UserType userType,
    required String registration,
    required BuildContext context,
  }) async {
    //User to use: mw6atk6gp
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(userType == UserType.student ? 'students' : 'employees')
        .where('registration', isEqualTo: registration)
        .get();

    if (querySnapshot.docs.isNotEmpty && context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => userType == UserType.student
              ? const HomeStudentScreen()
              : const HomeEmployeeScreen(),
        ),
      );
    }
  }

  Future<void> getMenu() async {}
}
