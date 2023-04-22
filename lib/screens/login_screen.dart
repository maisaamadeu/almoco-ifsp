import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcc/default_colors.dart';
import 'package:tcc/service/firebase_service.dart';
import 'package:tcc/widgets/custom_button.dart';
import 'package:tcc/widgets/custom_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _prontuarioController = TextEditingController();

  UserType _selectedOption = UserType.student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackground,
      body: SafeArea(
        child: Stack(
          children: [
            //Size
            Container(
              height: MediaQuery.of(context).size.height,
            ),

            //Background
            Positioned(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SvgPicture.asset(
                  'assets/svgs/wave.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //Login Area
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Title
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

                    //Space
                    const SizedBox(
                      height: 25,
                    ),

                    //Input
                    CustomInput(
                      controller: _prontuarioController,
                      labelText: 'Prontuário',
                    ),

                    //Space
                    const SizedBox(
                      height: 22,
                    ),

                    //Radio Buttons
                    SizedBox(
                      width: 350,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio<UserType>(
                            value: UserType.student,
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
                            value: UserType.employee,
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

                    //Space
                    const SizedBox(
                      height: 25,
                    ),

                    //Login Button
                    CustomButton(
                      labelText: 'Logar',
                      color: defaultDarkGreen,
                      function: () async {
                        await FirebaseService().login(
                          userType: _selectedOption,
                          registration: _prontuarioController.text,
                          context: context,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
