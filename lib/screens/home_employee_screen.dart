import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcc/default_colors.dart';

class HomeEmployeeScreen extends StatelessWidget {
  const HomeEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackground,
      appBar: AppBar(
        backgroundColor: defaultBackground,
        elevation: 0,
      ),
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

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Title
                    const SizedBox(
                      width: 350,
                      child: Text(
                        'Seja Bem-Vindo(a), selecione abaixo quais dias gostaria de editar o menu!',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 32,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),

                    //Select Week
                    SizedBox(
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

                    //List of Meals
                    SizedBox(
                      height: 1000,
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
                                height: 150,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 250,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.edit,
                                            color: defaultGreen,
                                            size: 36,
                                          ),
                                        )
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
