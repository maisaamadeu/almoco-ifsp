import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tcc/default_colors.dart';
import 'package:tcc/screens/login_screen.dart';
import 'package:tcc/service/firebase_service.dart';
import 'package:tcc/widgets/custom_card.dart';

class HomeStudentScreen extends StatefulWidget {
  const HomeStudentScreen(
      {super.key,
      required this.registration,
      required this.firstName,
      required this.lastName});

  final String registration;
  final String firstName;
  final String lastName;

  @override
  State<HomeStudentScreen> createState() => _HomeStudentScreenState();
}

class _HomeStudentScreenState extends State<HomeStudentScreen> {
  late DateTime now;
  late DateTime startOfCurrentWeek;
  late DateTime endOfCurrentWeek;
  late List<String> dates;

  @override
  void initState() {
    now = DateTime.now();
    startOfCurrentWeek = DateTime(
      now.year,
      now.month,
      now.day - now.weekday + 1,
      0,
      0,
      0,
      0,
      0,
    );
    endOfCurrentWeek = DateTime(
      now.year,
      now.month,
      now.day - now.weekday + 5,
      23,
      59,
      59,
      999,
      999,
    );
    FirebaseService().getMenu(now);
    dates = getDates(startOfCurrentWeek, endOfCurrentWeek);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackground,
      appBar: AppBar(
        backgroundColor: defaultBackground,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
          ),
        ],
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

            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: StreamBuilder(
                  stream:
                      FirebaseFirestore.instance.collection('menu').snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return CircularProgressIndicator(
                            color: defaultDarkGreen);
                      default:
                        if (snapshot.hasError) {
                          return const Text(
                            'Ocorreu um erro ao buscar os dados. Tente novamente mais tarde!',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 32,
                              fontFamily: 'Roboto',
                            ),
                          );
                        } else {
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //Title
                                SizedBox(
                                  width: 350,
                                  child: Text(
                                    'Seja Bem-Vindo(a) ${widget.firstName} ${widget.lastName}, selecione abaixo quais dias irá comer!',
                                    style: const TextStyle(
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
                                        onPressed: () {
                                          setState(() {
                                            now = now.subtract(
                                                const Duration(days: 7));
                                            startOfCurrentWeek = DateTime(
                                              now.year,
                                              now.month,
                                              now.day - now.weekday + 1,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                            );
                                            endOfCurrentWeek = DateTime(
                                              now.year,
                                              now.month,
                                              now.day - now.weekday + 5,
                                              23,
                                              59,
                                              59,
                                              999,
                                              999,
                                            );
                                            FirebaseService().getMenu(now);
                                            dates = getDates(startOfCurrentWeek,
                                                endOfCurrentWeek);
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.arrow_back,
                                          size: 24,
                                        ),
                                      ),
                                      Text(
                                        'Semana ${formatTimestamp(startOfCurrentWeek)} a ${formatTimestamp(endOfCurrentWeek)}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            now = now
                                                .add(const Duration(days: 7));
                                            startOfCurrentWeek = DateTime(
                                              now.year,
                                              now.month,
                                              now.day - now.weekday + 1,
                                              0,
                                              0,
                                              0,
                                              0,
                                              0,
                                            );
                                            endOfCurrentWeek = DateTime(
                                              now.year,
                                              now.month,
                                              now.day - now.weekday + 5,
                                              23,
                                              59,
                                              59,
                                              999,
                                              999,
                                            );
                                            FirebaseService().getMenu(now);
                                            dates = getDates(startOfCurrentWeek,
                                                endOfCurrentWeek);
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.arrow_forward,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                FutureBuilder<Map<String, dynamic>?>(
                                  future: FirebaseService().getMenu(now),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const CircularProgressIndicator();
                                    } else if (snapshot.hasData) {
                                      final currentWeekData = snapshot.data!;
                                      return Column(
                                        children: [
                                          //List of meals
                                          SizedBox(
                                            height: 1000,
                                            width: 350,
                                            child: ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  currentWeekData['menu_days']
                                                      .length,
                                              itemBuilder: (context, i) {
                                                return CustomCard(
                                                  doc: currentWeekData[
                                                      'menu_days'][i],
                                                  date: dates[i],
                                                  isEmployee: false,
                                                  index: i,
                                                  registration:
                                                      widget.registration,
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return const SizedBox(
                                        width: 350,
                                        child: Text(
                                            'Está semana não encontrada. Pedimos desculpa pelo incoveniente.'),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatTimestamp(DateTime date) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final formattedDate = dateFormat.format(date);
    return formattedDate;
  }

  List<String> getDates(DateTime startDate, DateTime endDate) {
    final List<String> dates = [];

    // Adiciona um dia por vez até chegar à data final
    for (DateTime date = startDate;
        date.isBefore(endDate) || date.isAtSameMomentAs(endDate);
        date = date.add(const Duration(days: 1))) {
      // Converte a data para uma string no formato desejado
      final formattedDate = DateFormat('dd/MM/yyyy').format(date);
      dates.add(formattedDate);
    }

    return dates;
  }
}
