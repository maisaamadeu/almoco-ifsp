import 'package:flutter/material.dart';
import 'package:tcc/default_colors.dart';

enum Options { estudante, servidor }

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController prontuarioController = TextEditingController();

  Options selectedOption = Options.estudante;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackground,
      body: Stack(
        children: [
          //Red Circle
          Positioned(
            left: 114,
            top: -313,
            child: Container(
              width: 670,
              height: 670,
              decoration: BoxDecoration(
                color: defaultRed,
                borderRadius: BorderRadius.circular(670),
              ),
            ),
          ),

          //Green Circle
          Positioned(
            left: -230,
            top: 450,
            child: Container(
              width: 670,
              height: 670,
              decoration: BoxDecoration(
                color: defaultGreen,
                borderRadius: BorderRadius.circular(670),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
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
                    controller: prontuarioController,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                        value: Options.estudante,
                        groupValue: selectedOption,
                        onChanged: (option) {
                          setState(() {
                            selectedOption = option!;
                          });
                        },
                        activeColor: Colors.white,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                      ),
                      const Text(
                        'Estudante',
                        style: TextStyle(color: Colors.white),
                      ),
                      Radio(
                        value: Options.servidor,
                        groupValue: selectedOption,
                        onChanged: (option) {
                          setState(() {
                            selectedOption = option!;
                          });
                        },
                        activeColor: Colors.white,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                      ),
                      const Text(
                        'Servidor',
                        style: TextStyle(color: Colors.white),
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
        ],
      ),
    );
  }
}
