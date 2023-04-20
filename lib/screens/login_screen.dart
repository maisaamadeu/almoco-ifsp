import 'package:flutter/material.dart';
import 'package:tcc/default_colors.dart';

enum UserType { estudante, servidor }

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _prontuarioController = TextEditingController();

  UserType _selectedOption = UserType.estudante;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
              ),
              const SizedBox(
                width: 358,
                height: 129,
                child: Text(
                  'Realize o seu login abaixo para acessar o aplicativo',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 56,
                width: 350,
                child: TextField(
                  controller: _prontuarioController,
                  cursorColor: defaultDarkGreen,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Prontuário',
                    labelStyle: TextStyle(
                      color: defaultDarkGreen,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                        color: defaultDarkGreen,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                        color: defaultDarkGreen,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              SizedBox(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio<UserType>(
                      value: UserType.estudante,
                      groupValue: _selectedOption,
                      onChanged: (option) {
                        setState(() {
                          _selectedOption = option!;
                        });
                      },
                      activeColor: Colors.black,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black),
                    ),
                    const Text(
                      'Estudante',
                      style: TextStyle(color: Colors.black),
                    ),
                    Radio<UserType>(
                      value: UserType.servidor,
                      groupValue: _selectedOption,
                      onChanged: (option) {
                        setState(() {
                          _selectedOption = option!;
                        });
                      },
                      activeColor: Colors.black,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black),
                    ),
                    const Text(
                      'Servidor',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 350,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: defaultDarkGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        350,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Logar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
