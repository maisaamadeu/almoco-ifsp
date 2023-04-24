import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tcc/controllers/document_controller.dart';
import 'package:tcc/screens/home_employee_screen.dart';
import 'package:tcc/screens/home_student_screen.dart';

enum UserType { student, employee }

final DocumentController documentController = DocumentController();

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
      print((querySnapshot.docs[0].data() as Map)['first_name']);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => userType == UserType.student
              ? HomeStudentScreen(
                  firstName:
                      (querySnapshot.docs[0].data() as Map)['first_name'],
                  lastName: (querySnapshot.docs[0].data() as Map)['last_name'],
                  registration:
                      (querySnapshot.docs[0].data() as Map)['registration'],
                )
              : HomeEmployeeScreen(
                  firstName:
                      (querySnapshot.docs[0].data() as Map)['first_name'],
                  lastName: (querySnapshot.docs[0].data() as Map)['last_name'],
                  registration:
                      (querySnapshot.docs[0].data() as Map)['registration'],
                ),
        ),
      );
    }
  }

  Future<Map<String, dynamic>?> getMenu(DateTime now) async {
    final startOfCurrentWeek = DateTime(
      now.year,
      now.month,
      now.day - now.weekday + 1,
      0,
      0,
      0,
      0,
      0,
    );
    final endOfCurrentWeek = DateTime(
      now.year,
      now.month,
      now.day - now.weekday + 5,
      23,
      59,
      59,
      999,
      999,
    );
    final startOfCurrentWeekTimestamp = Timestamp.fromDate(startOfCurrentWeek);
    final endOfCurrentWeekTimestamp = Timestamp.fromDate(endOfCurrentWeek);

    final weekDataQuery = FirebaseFirestore.instance.collection('menu');

    final querySnapshot = await weekDataQuery.get();

    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        if ((doc.data()['start_of_the_week'] as Timestamp).seconds ==
                startOfCurrentWeekTimestamp.seconds &&
            (doc.data()['end_of_the_week'] as Timestamp).seconds ==
                endOfCurrentWeekTimestamp.seconds) {
          documentController.setDocumentID(doc.id);
          return doc.data();
        }
      }
    }

    return null;
  }

  Future<void> editMenu({
    String? mainCourse,
    String? salad,
    String? fruit,
  }) async {
    print(DocumentController().documentID);
    if (DocumentController().documentID.isNotEmpty) {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('menu')
          .doc(DocumentController().documentID)
          .get();

      print(querySnapshot);
    } else {
      print('Está vazio');
    }
  }

  Future<void> duplicateDocument() async {
    try {
      // Recupera o documento original da coleção
      final DocumentSnapshot originalDocument = await FirebaseFirestore.instance
          .collection('menu')
          .doc('3ZHH6A7KPzYkkeTrRrzo')
          .get();
      final Object? originalData = originalDocument.data();

      // Checa se já existe um documento com esse nome e incrementa um número se necessário
      DocumentReference newDocumentRef =
          FirebaseFirestore.instance.collection('menu').doc();

      // Duplica o documento original com o novo nome
      await newDocumentRef.set(originalData);
      print('Documento duplicado com sucesso!');
    } catch (e) {
      print('Erro ao duplicar documento: $e');
    }
  }
}
