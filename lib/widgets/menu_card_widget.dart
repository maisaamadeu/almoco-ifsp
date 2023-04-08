import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tcc/api.dart';

class MenuCardWidget extends StatefulWidget {
  MenuCardWidget(
      {super.key,
      required this.item,
      this.id,
      required this.prontuario,
      this.isEmployee = false});
  final dynamic item;
  final String prontuario;
  final dynamic id;
  final bool isEmployee;

  @override
  State<MenuCardWidget> createState() => _MenuCardWidgetState();
}

class _MenuCardWidgetState extends State<MenuCardWidget> {
  IconData icon = Icons.close;
  String labelText = "Não irei almoçar neste dia";
  TextEditingController mainCourse = TextEditingController();
  TextEditingController fruit = TextEditingController();
  TextEditingController salad = TextEditingController();

  @override
  void initState() {
    super.initState();

    widget.isEmployee ? null : checkStudens();
    widget.isEmployee ? mainCourse.text = widget.item['main_course'] : null;
    widget.isEmployee ? fruit.text = widget.item['fruit'] : null;
    widget.isEmployee ? salad.text = widget.item['salad'] : null;
  }

  checkStudens() async {
    bool res =
        await API().getStudent(prontuario: widget.prontuario, id: widget.id);

    updateState(res);
  }

  updateState(bool res) {
    setState(() {
      if (res) {
        icon = Icons.check;
        labelText = 'Irei almoçar neste dia';
      } else {
        icon = Icons.close;
        labelText = 'Não irei almoçar neste dia';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Data: '),
                        Expanded(
                          child: Text(
                            widget.item["date"],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Prato Principal: '),
                        Expanded(
                          child: Text(
                            widget.item['main_course'],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Fruta: '),
                        Expanded(
                          child: Text(
                            widget.item['fruit'],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Salada: '),
                        Expanded(
                          child: Text(
                            widget.item['salad'],
                          ),
                        ),
                      ],
                    ),
                    widget.isEmployee
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Alunos: '),
                              Expanded(
                                child: Text(
                                  widget.item['alunos'].length.toString(),
                                ),
                              ),
                            ],
                          )
                        : Container()
                  ],
                ),
              ),
              widget.isEmployee
                  ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Alert(
                                  context: context,
                                  title: "Edição",
                                  content: Column(
                                    children: <Widget>[
                                      TextField(
                                        controller: mainCourse,
                                        decoration: const InputDecoration(
                                          labelText: 'Prato Principal',
                                        ),
                                      ),
                                      TextField(
                                        controller: fruit,
                                        decoration: const InputDecoration(
                                          labelText: 'Fruta',
                                        ),
                                      ),
                                      TextField(
                                        controller: salad,
                                        decoration: const InputDecoration(
                                          labelText: 'Salada',
                                        ),
                                      ),
                                    ],
                                  ),
                                  buttons: [
                                    DialogButton(
                                      onPressed: () async {
                                        await API().setMenu(
                                            mainCourse: mainCourse.text,
                                            fruit: fruit.text,
                                            salad: salad.text,
                                            id: widget.id);
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Salvar",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    )
                                  ]).show();
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          const Text('Editar'),
                        ],
                      ),
                    )
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () async {
                              if (icon == Icons.close) {
                                await API().addStudent(
                                    prontuario: widget.prontuario,
                                    id: widget.id);

                                setState(() {
                                  icon = Icons.check;
                                  labelText = 'Irei almoçar neste dia';
                                });
                              } else {
                                await API().removeStudent(
                                    prontuario: widget.prontuario,
                                    id: widget.id);

                                setState(() {
                                  icon = Icons.close;
                                  labelText = 'Não irei almoçar neste dia';
                                });
                              }
                            },
                            icon: Icon(icon),
                          ),
                          Text(
                            labelText,
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
