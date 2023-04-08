import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('AlertDialog Title'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('This is a demo alert dialog.'),
            Text('Would you like to approve of this message?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Approve'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
