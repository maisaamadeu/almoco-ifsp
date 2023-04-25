import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcc/default_colors.dart';
import 'package:tcc/service/firebase_service.dart';
import 'package:tcc/widgets/custom_button.dart';
import 'package:tcc/widgets/custom_input.dart';

class EditMenuScreen extends StatefulWidget {
  const EditMenuScreen(
      {super.key,
      required this.index,
      required this.mainCourse,
      required this.fruit,
      required this.salad});

  final int index;
  final String mainCourse;
  final String fruit;
  final String salad;

  @override
  State<EditMenuScreen> createState() => _EditMenuScreenState();
}

class _EditMenuScreenState extends State<EditMenuScreen> {
  TextEditingController mainCourseController = TextEditingController();
  TextEditingController saladController = TextEditingController();
  TextEditingController fruitController = TextEditingController();

  @override
  void initState() {
    mainCourseController.text = widget.mainCourse;
    saladController.text = widget.salad;
    fruitController.text = widget.fruit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Title
                      const SizedBox(
                        width: 350,
                        child: Text(
                          'Edite as informações abaixo conforme sua necessidade :)',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 32,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),

                      //Main Course
                      CustomInput(
                        controller: mainCourseController,
                        labelText: 'Prato Principal',
                      ),

                      //Salad
                      CustomInput(
                        controller: saladController,
                        labelText: 'Salada',
                      ),

                      //Main Course
                      CustomInput(
                        controller: fruitController,
                        labelText: 'Fruta',
                      ),

                      //Buttons
                      Container(
                        width: 350,
                        height: 56,
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Row(
                          children: [
                            //Save
                            Expanded(
                                child: CustomButton(
                              labelText: 'Salvar',
                              color: defaultDarkGreen,
                              function: () async {
                                await FirebaseService().editMenu(
                                    index: widget.index,
                                    fruit: fruitController.text,
                                    mainCourse: mainCourseController.text,
                                    salad: saladController.text,
                                    showErrorDialog: _showErrorDialog);
                                if (context.mounted) {
                                  Navigator.pop(context);
                                }
                              },
                            )),

                            //Space
                            const SizedBox(
                              width: 10,
                            ),

                            //Cancel
                            Expanded(
                              child: CustomButton(
                                labelText: 'Cancelar',
                                color: defaultRed,
                                function: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Erro"),
          content: Text("Ocorreu um erro. Tente novamente mais tarde."),
          actions: [
            ElevatedButton(
              child: Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
