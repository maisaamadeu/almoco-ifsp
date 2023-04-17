import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:tcc/default_colors.dart';

class HomeStudentScreen extends StatelessWidget {
  const HomeStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackground,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 1400,
            ),

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

            //Red Circle 2
            Positioned(
              left: 95,
              top: 1269,
              child: Container(
                width: 670,
                height: 670,
                decoration: BoxDecoration(
                  color: defaultRed,
                  borderRadius: BorderRadius.circular(670),
                ),
              ),
            ),

            //Students Vector
            Positioned(
              left: 55,
              top: -6,
              child: Image.asset(
                'assets/images/alunos.png',
                width: 455,
                height: 303,
              ),
            ),

            //Back Button
            Positioned(
              left: 12,
              top: 60,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back,
                  size: 42,
                ),
              ),
            ),

            //Title
            const Positioned(
              top: 326,
              left: 33,
              child: SizedBox(
                width: 300,
                child: Text(
                  'Seja Bem-Vindo(a), selecione abaixo quais dias irá comer!',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),

            //Select Week
            Positioned(
              top: 479,
              left: 20,
              child: SizedBox(
                width: 350,
                height: 52,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 24,
                      ),
                    ),
                    const Text(
                      'Semana 10/04/2023 a 14/04/2023',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 480,
              left: 26,
              child: SizedBox(
                height: 1750,
                width: 350,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        child: SizedBox(
                          height: 130,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Prato Principal: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 130,
                                          child: Text(
                                            'Arroz, Feijão, Carne Moída',
                                            style: TextStyle(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Salada: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          'Alface',
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

                                    //Fruit
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Fruta: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          'Laranja',
                                          style: TextStyle(
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
                                    colorConfig: MSHColorConfig
                                        .fromCheckedUncheckedDisabled(
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
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
