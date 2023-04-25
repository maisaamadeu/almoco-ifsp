import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:tcc/default_colors.dart';
import 'package:tcc/screens/edit_menu_screen.dart';
import 'package:tcc/service/firebase_service.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.doc,
      required this.date,
      this.isEmployee,
      required this.index,
      required this.registration,
      this.isEat,
      this.studentsEat});

  final Map<String, dynamic> doc;
  final int index;
  final String date;
  final bool? isEmployee;
  final String registration;
  final bool? isEat;
  final int? studentsEat;

  @override
  Widget build(BuildContext context) {
    if (doc['main_course'] != null &&
        doc['main_course'] != '' &&
        doc['salad'] != null &&
        doc['salad'] != '' &&
        doc['fruit'] != null &&
        doc['fruit'] != '') {
      return Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Day of Week
                    Text(
                      '$date - ${dayOfWeek(date)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),

                    //Space of Elements
                    const SizedBox(
                      height: 5,
                    ),

                    //Type
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Atividade: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Almoço',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    //Space of Elements
                    const SizedBox(
                      height: 5,
                    ),

                    //Principal Food
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Prato Principal: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 130,
                          child: Text(
                            doc['main_course'] != null &&
                                    doc['main_course'] != ''
                                ? doc['main_course']
                                : 'Nada informado',
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    //Space of Elements
                    const SizedBox(
                      height: 5,
                    ),

                    //Salad
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Salada: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          doc['salad'] != null && doc['salad'] != ''
                              ? doc['salad']
                              : 'Nada informado',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    //Space of Elements
                    const SizedBox(
                      height: 5,
                    ),

                    //Fruit
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Fruta: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          doc['fruit'] != null && doc['fruit'] != ''
                              ? doc['fruit']
                              : 'Nada informado',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    //Total
                    isEmployee == true
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'Alunos: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                studentsEat != null
                                    ? studentsEat.toString()
                                    : 'Erro',
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isEmployee == false
                      ? MSHCheckbox(
                          size: 40,
                          value: isEat!,
                          colorConfig:
                              MSHColorConfig.fromCheckedUncheckedDisabled(
                            checkedColor: defaultGreen,
                            disabledColor: defaultRed,
                            uncheckedColor: defaultRed,
                          ),
                          style: MSHCheckboxStyle.fillFade,
                          onChanged: (selected) {
                            FirebaseService().addOrRemoveStudent(
                              index: index,
                              registration: registration,
                            );
                          },
                        )
                      : IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EditMenuScreen(
                                  index: index,
                                  fruit: doc['fruit'].toString(),
                                  mainCourse: doc['main_course'].toString(),
                                  salad: doc['salad'].toString(),
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.edit,
                            color: defaultGreen,
                            size: 30,
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Day of Week
                    Text(
                      '$date - ${dayOfWeek(date)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),

                    //Space of Elements
                    const SizedBox(
                      height: 5,
                    ),

                    //Day of Week
                    Text(
                      'NESTE DIA NÃO HAVERÁ ALMOÇO, PELO MENOS NADA FOI INFORMADO OU ESTÁ INCOMPLETO ATÉ O MOMENTO!',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: defaultRed,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
  }

  String formatTimestamp(Timestamp timestamp) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final dateTime = timestamp.toDate();
    final formattedDate = dateFormat.format(dateTime);
    return formattedDate;
  }

  String dayOfWeek(String day) {
    final dayFormat = DateFormat('dd/MM/yyyy').parse(day);
    String dayOfWeek = DateFormat('EEEE', 'pt_BR').format(dayFormat);

    dayOfWeek = dayOfWeek.replaceAll('-feira', '');

    String formattedDayOfWeek =
        '${dayOfWeek.replaceFirst(dayOfWeek[0], dayOfWeek[0].toUpperCase())}-Feira';

    return formattedDayOfWeek;
  }
}
