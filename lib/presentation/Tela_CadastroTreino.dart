import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projeto_final/core/App_CadastroTreino2.dart';
import 'package:projeto_final/service/service_page_get.dart';

class CadastroTreino extends StatefulWidget {
  final int i;
  final String titulo;
  final String? email_aluno;
  final String? id_aluno;
  const CadastroTreino(
      {Key? key, required this.i,
      required this.titulo,
      String? email_aluno,
      String? id_aluno})
      : this.email_aluno = email_aluno,
        this.id_aluno = id_aluno, super(key: key);

  @override
  _CadastroTreinoState createState() => _CadastroTreinoState();
}

class _CadastroTreinoState extends State<CadastroTreino> {
  bool state = false;

  final List exercicios = [];

  String id_aluno = '';

  final service_get = ServicePageGet();

  final _formtreino = GlobalKey<FormState>();

  void enviaList() {
    _formtreino.currentState!.save();

    if (widget.i == 1) {
      id_aluno = service_get.retornaIdAluno();
    } else {
      id_aluno = widget.id_aluno.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.i == 1) {
      service_get.getSpecificAluno(widget.email_aluno.toString());
    }
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: Text('Day Gym'),
        centerTitle: true,
        shadowColor: Colors.white,
        leading: Icon(Icons.ad_units_rounded),
        leadingWidth: 50,
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: Form(
        key: _formtreino,
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.titulo,
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontFamily: 'Pacifico'),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 0.0, bottom: 90.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 60.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 0.0, bottom: 0.0, left: 10),
                        child: TextFormField(
                          onSaved: (text) => exercicios.add(text),
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Exercício 1',
                              prefixIcon: const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 0.0, bottom: 0.0, left: 10),
                        child: TextFormField(
                          onSaved: (text) => exercicios.add(text),
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Exercício 2',
                              prefixIcon: const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 0.0, bottom: 0.0, left: 10),
                        child: TextFormField(
                          onSaved: (text) => exercicios.add(text),
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Exercício 3',
                              prefixIcon: const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 0.0, bottom: 0.0, left: 10),
                        child: TextFormField(
                          onSaved: (text) => exercicios.add(text),
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Exercício 4',
                              prefixIcon: const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 0.0, bottom: 0.0, left: 10),
                        child: TextFormField(
                          onSaved: (text) => exercicios.add(text),
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Exercício 5',
                              prefixIcon: const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      if (state)
                        CircularProgressIndicator()
                      else
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 120, vertical: 20)),
                          onPressed: () {
                            state = true;
                            if (widget.i == 1) {
                              enviaList();
                              Timer(Duration(seconds: 3), () {
                                state = false;
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => App_CadastroTreino2(
                                          exercicios: exercicios,
                                          i: 1,
                                          titulo: 'Treino 1',
                                          id_aluno: id_aluno)),
                                );
                              });
                            } else if (widget.i == 2) {
                              enviaList();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => App_CadastroTreino2(
                                        exercicios: exercicios,
                                        i: 2,
                                        titulo: 'Treino 2',
                                        id_aluno: id_aluno)),
                              );
                            } else if (widget.i == 3) {
                              enviaList();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => App_CadastroTreino2(
                                        exercicios: exercicios,
                                        i: 3,
                                        titulo: 'Treino 3',
                                        id_aluno: id_aluno)),
                              );
                            } else if (widget.i == 4) {
                              enviaList();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => App_CadastroTreino2(
                                        exercicios: exercicios,
                                        i: 4,
                                        titulo: 'Treino 4',
                                        id_aluno: id_aluno)),
                              );
                            } else if (widget.i == 5) {
                              enviaList();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => App_CadastroTreino2(
                                        exercicios: exercicios,
                                        i: 5,
                                        titulo: 'Treino 5',
                                        id_aluno: id_aluno)),
                              );
                            }
                          },
                          child: Text(
                            'Continuar Cadastro',
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal),
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
    );
  }
}
