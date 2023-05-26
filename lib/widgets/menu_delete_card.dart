import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class MenuDeleteCard extends StatefulWidget {
  final Timestamp startOfTheWeek;
  final Timestamp endOfTheWeek;
  final Function() onChanged;

   MenuDeleteCard({
    required this.startOfTheWeek,
    required this.endOfTheWeek, required this.onChanged,

  });

  @override
  State<MenuDeleteCard> createState() => _MenuDeleteCardState();
}

class _MenuDeleteCardState extends State<MenuDeleteCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');

    final formattedStartOfTheWeek = dateFormat.format(widget.startOfTheWeek.toDate());
    final formattedEndOfTheWeek = dateFormat.format(widget.endOfTheWeek.toDate());

    return Card(
      child: ListTile(
        leading: MSHCheckbox(
          size: 30,
          value: isSelected,
          onChanged: (selected) {
            widget.onChanged();
            setState(() {
              isSelected = selected;
            });

          },
        ),
        title: Text('Início da Semana: $formattedStartOfTheWeek'),
        subtitle: Text('Fim da Semana: $formattedEndOfTheWeek'),
      ),
    );
  }
}
