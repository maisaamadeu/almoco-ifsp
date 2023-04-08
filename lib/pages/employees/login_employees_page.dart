import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tcc/api.dart';
import 'package:tcc/controller/controller.dart';
import 'package:tcc/kColors.dart';
import 'package:tcc/pages/employees/home_employees_page.dart';
import 'package:tcc/pages/students/home_students_page.dart';
import 'package:tcc/widgets/alert_dialog_widget.dart';
import 'package:tcc/widgets/button_widget.dart';
import 'package:tcc/widgets/text_field_widget.dart';

class LoginEmployeesPage extends StatefulWidget {
  LoginEmployeesPage({super.key});

  @override
  State<LoginEmployeesPage> createState() => _LoginEmployeesPageState();
}

class _LoginEmployeesPageState extends State<LoginEmployeesPage> {
  TextEditingController textEditingController = TextEditingController();

  bool hasNull = false;
  bool isSignedIn = false;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialogWidget();
        });
  }

  void navigateToHomePage(String firstName) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => HomeEmployeesPage(
          pronturario: textEditingController.text,
          name: firstName,
        ),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreen,
      appBar: AppBar(
        title: const Text('Servidor'),
        backgroundColor: kRed,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.school,
                size: 250,
                color: Colors.white,
              ),
              TextFieldWidget(
                controller: textEditingController,
                hasNull: hasNull,
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<Controller>(
                builder: (context, value, child) {
                  return value.isSignedIn
                      ? CircularProgressIndicator(
                          color: kRed,
                        )
                      : ButtonWidget(
                          labelText: 'Logar',
                          functionButton: () async {
                            if (textEditingController.text == '' ||
                                textEditingController.text == null) {
                              setState(() {
                                hasNull = true;
                              });
                            } else {
                              Provider.of<Controller>(context, listen: false)
                                  .setIsSignedIn();
                              await API().signIn(
                                prontuario: textEditingController.text,
                                navigateToHomePage: navigateToHomePage,
                                isEmployee: true,
                              );
                              Provider.of<Controller>(context, listen: false)
                                  .setIsSignedIn();
                            }
                          },
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
