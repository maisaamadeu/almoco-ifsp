import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/widgets/menu_card_widget.dart';

import '../../controller/controller.dart';
import '../select_login_page.dart';

class HomeEmployeesPage extends StatelessWidget {
  final String pronturario;
  final String name;

  const HomeEmployeesPage(
      {super.key, required this.pronturario, required this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Cardárpio IFSP BTV"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ChangeNotifierProvider.value(
                      value: Controller(),
                      child: SelectLoginPage(),
                    );
                  },
                ),
              );
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Seja Bem-Vindo(a), ${name}',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('menu')
                  .orderBy('id')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                            'Ocorreu um erro ao carregar os dados do cardápio, tente novamente mais tarde'),
                      );
                    } else {
                      var data = snapshot.data!.docs;

                      return Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var item = data[index];

                            return MenuCardWidget(
                              item: item,
                              id: item.id,
                              prontuario: pronturario,
                              isEmployee: true,
                            );
                          },
                          itemCount: data.length,
                        ),
                      );
                    }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
