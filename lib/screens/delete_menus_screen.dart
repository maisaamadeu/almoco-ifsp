import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcc/service/firebase_service.dart';
import 'package:tcc/widgets/custom_button.dart';
import 'package:tcc/widgets/menu_delete_card.dart';

class DeleteMenusScreen extends StatefulWidget {
  List<DocumentSnapshot> deleteMenus = [];
  @override
  State<DeleteMenusScreen> createState() => _DeleteMenusScreenState();
}

class _DeleteMenusScreenState extends State<DeleteMenusScreen> {


  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ops!'),
          content: Text('Não é possível apagar alguma semana se nenhuma estiver selecionada...'),
          actions: [
            TextButton(
              child: Text('Selecionar semanas'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,

      ),
      body: SafeArea(
        child: Stack(children: [
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
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('menu')
                    .orderBy('start_of_the_week')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Erro ao carregar os menus');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasData) {
                    List<DocumentSnapshot> menuDocs = snapshot.data!.docs;

                    return SizedBox(
                      width: 350,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //Title
                            Text(
                              'Selecione as semanas abaixo que gostaria de apagar:',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 32,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Flexible(
                              child: ListView.builder(
                                itemCount: menuDocs.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  Map<String, dynamic> menuData = menuDocs[index]
                                      .data() as Map<String, dynamic>;

                                  // Aqui você pode exibir as informações do menu, como o nome, preço, etc.
                                  return MenuDeleteCard(
                                    startOfTheWeek: menuData['start_of_the_week'],
                                    endOfTheWeek: menuData['end_of_the_week'],
                                    onChanged: () {
                                      addMenuToDelete(menuDocs[index]);
                                    },
                                  );
                                },
                              ),
                            ),  SizedBox(
                              height: 25,
                            ),
                            CustomButton(labelText: 'Apagar Semanas Selecionadas', color: Colors.red, function:
                             (){
                              if(widget.deleteMenus.isEmpty) {
                                showAlert(context);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Tem certeza?'),
                                      content: Text('Lembre-se, não é possível voltar atrás dessa decisão.'),
                                      actions: [
                                        TextButton(
                                          child: Text('Cancelar', style: TextStyle(color: Colors.red),),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Sim, tenho certeza!'),
                                          onPressed: ()  {
                                            FirebaseService().deleteMenuItems(widget.deleteMenus);
                                            Navigator.pop(context);
                                              Navigator.pop(context);

                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );

                              }
                             }
                            )
                          ],
                        ),
                      ),
                    );
                  }

                  return Text('Nenhum menu encontrado');
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }

  addMenuToDelete(DocumentSnapshot doc) {
    if (widget.deleteMenus.contains(doc)) {
      widget.deleteMenus.remove(doc);
    } else {
      widget.deleteMenus.add(doc);
    }

    print(widget.deleteMenus);
  }
}
