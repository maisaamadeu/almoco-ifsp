import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:tcc/default_colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.doc});

  final Map<String, dynamic> doc;

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
          child: SizedBox(
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Day of Week
                      const Text(
                        '10/04/2023 - Segunda-Feira',
                        style: TextStyle(
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
                              maxLines: 2,
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
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MSHCheckbox(
                      size: 40,
                      value: true,
                      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                        checkedColor: defaultGreen,
                        disabledColor: defaultRed,
                        uncheckedColor: defaultRed,
                      ),
                      style: MSHCheckboxStyle.fillFade,
                      onChanged: (selected) {},
                    ),
                  ],
                ),
              ],
            ),
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
          child: SizedBox(
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Day of Week
                      const Text(
                        '10/04/2023 - Segunda-Feira',
                        style: TextStyle(
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
                        'NESTE DIA NÃO HAVERÁ ALMOÇO, PELO MENOS NADA FOI INFORMADO ATÉ O MOMENTO!',
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
}
