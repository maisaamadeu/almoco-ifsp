import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tcc/controllers/document_controller.dart';
import 'package:tcc/screens/home_employee_screen.dart';
import 'package:tcc/screens/home_student_screen.dart';

enum UserType { student, employee }

class FirebaseService {
  Future<void> initFirebase() async {
    await Firebase.initializeApp();
    // duplicateDocument();
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

    List<dynamic> start = [];
    List<dynamic> end = [];

    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        start.add((doc.data()['start_of_the_week'] as Timestamp).toDate());
        end.add((doc.data()['end_of_the_week'] as Timestamp).toDate());
      }

      DocumentController().documentsStarted = start;
      DocumentController().documentsEnd = end;

      for (var doc in querySnapshot.docs) {
        if ((doc.data()['end_of_the_week'] as Timestamp).seconds ==
            endOfCurrentWeekTimestamp.seconds) {
          DocumentController().documentID = doc.id;
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
    required int index,
  }) async {
    if (DocumentController().documentID.isNotEmpty) {
      var menuRef = FirebaseFirestore.instance
          .collection('menu')
          .doc(DocumentController().documentID);

      var snapshot = await menuRef.get();

      if (snapshot.exists) {
        var data = snapshot.data();
        var menuDays = data!['menu_days'];
        menuDays[index]['salad'] = salad;
        menuDays[index]['main_course'] = mainCourse;
        menuDays[index]['fruit'] = fruit;

        await menuRef.set(data);
      } else {}
    } else {
      print('Está vazio');
    }
  }

  Future<void> addOrRemoveStudent({
    required int index,
    required String registration,
  }) async {
    if (DocumentController().documentID.isNotEmpty) {
      var studentsRef = FirebaseFirestore.instance
          .collection('menu')
          .doc(DocumentController().documentID);

      try {
        await FirebaseFirestore.instance.runTransaction((transaction) async {
          var snapshot = await transaction.get(studentsRef);

          if (snapshot.exists) {
            var data = snapshot.data();
            List<dynamic> students = data!['menu_days'][index]['students'];

            if (students.contains(registration)) {
              students.remove(registration);
            } else {
              students.add(registration);
            }

            transaction.update(studentsRef, {
              'menu_days.$index.students': students,
            });
          }
        });
      } catch (e) {
        // Trate qualquer erro de transação aqui
        print('Erro na transação: $e');
      }
    }
  }

  Future<void> addWeek() async {
    DocumentController().documentsStarted.sort((a, b) => b.compareTo(a));
    DocumentController().documentsEnd.sort((a, b) => b.compareTo(a));

    DateTime startDay = (DocumentController().documentsStarted[0] as DateTime)
        .add(const Duration(days: 7));

    List<Map<String, dynamic>> menuDays = [];

    for (int i = 0; i < 5; i++) {
      DateTime day = startDay.add(Duration(days: i));
      Timestamp dayTimestamp = Timestamp.fromDate(day);

      Map<String, dynamic> menuDay = {
        'date': dayTimestamp,
        'salad': null,
        'fruit': null,
        'main_course': null,
        'students': [],
      };

      menuDays.add(menuDay);
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
