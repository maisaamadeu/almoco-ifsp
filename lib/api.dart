import 'package:cloud_firestore/cloud_firestore.dart';

class API {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  signIn({
    required String prontuario,
    required dynamic navigateToHomePage,
    bool isEmployee = false,
  }) async {
    if (isEmployee) {
      final CollectionReference _collectionRef = _db.collection('employees');
      bool isValid = false;

      await _collectionRef.get().then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((doc) {
          if (doc.exists) {
            if (doc.data() != null) {
              var data = (doc.data() as Map);
              if (data['ID'].toString() == prontuario) {
                navigateToHomePage(data['First Name']);
              }
            }
          }
        });
      }).catchError((error) => print(error));
    } else {
      final CollectionReference _collectionRef = _db.collection('students');
      bool isValid = false;

      await _collectionRef.get().then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((doc) {
          if (doc.exists) {
            if (doc.data() != null) {
              var data = (doc.data() as Map);
              if (data['Matricula'].toString() == prontuario) {
                navigateToHomePage(data['First Name']);
              }
            }
          }
        });
      }).catchError((error) => print(error));
    }
  }

  Future<bool> addStudent({
    required String prontuario,
    required String id,
  }) async {
    final DocumentReference _documentRef = _db.collection('menu').doc(id);
    print(_documentRef.get().then((value) => print(value.data())));

    if (_documentRef != null) {
      await _documentRef.update({
        "alunos": FieldValue.arrayUnion([prontuario])
      });
      print('adicionou, eu acho');
      return true;
    }

    return false;
  }

  Future<bool> removeStudent({
    required String prontuario,
    required String id,
  }) async {
    final DocumentReference _documentRef = _db.collection('menu').doc(id);

    if (_documentRef != null) {
      await _documentRef.update({
        "alunos": FieldValue.arrayRemove([prontuario])
      });
      return true;
    }

    return false;
  }

  Future<bool> getStudent({
    required String prontuario,
    required String id,
  }) async {
    final DocumentReference documentRef = _db.collection('menu').doc(id);

    DocumentSnapshot documentSnapshot = await documentRef.get();

    List<dynamic> students = documentSnapshot.get('alunos');

    if (students.contains(prontuario)) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setMenu({
    required String mainCourse,
    required String fruit,
    required String salad,
    required String id,
  }) async {
    final DocumentReference _documentRef = _db.collection('menu').doc(id);

    if (_documentRef != null) {
      await _documentRef.update({
        "main_course": mainCourse,
        "fruit": fruit,
        "salad": salad,
      });
      return true;
    }

    return false;
  }
}
