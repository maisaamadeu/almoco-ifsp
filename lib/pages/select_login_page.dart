import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tcc/Pages/students/login_students_page.dart';
import 'package:tcc/controller/controller.dart';
import 'package:tcc/kColors.dart';
import 'package:tcc/pages/employees/login_employees_page.dart';
import 'package:tcc/widgets/alert_dialog_widget.dart';
import 'package:tcc/widgets/button_widget.dart';

class SelectLoginPage extends StatelessWidget {
  const SelectLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: SizedBox(
                  height: 200,
                  child: Image.asset('assets/images/ifsp-btv.jpg'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Cardárpio IFSP Boituva',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Selecione sua função na instituição para ir para sua respectiva página de login!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                labelText: 'Sou um Trabalhador',
                functionButton: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ChangeNotifierProvider.value(
                          value: Controller(),
                          child: LoginEmployeesPage(),
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                labelText: 'Sou um Estudante',
                functionButton: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ChangeNotifierProvider.value(
                          value: Controller(),
                          child: LoginStudentsPage(),
                        );
                      },
                    ),
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
