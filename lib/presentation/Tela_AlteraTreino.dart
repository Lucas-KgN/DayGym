import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Aluno.dart';
import 'package:projeto_final/classes/Treino.dart';
import 'package:projeto_final/core/App_Alunos.dart';
import 'package:projeto_final/core/App_InfoAluno.dart';
import 'package:projeto_final/core/App_Prof_Inicio.dart';
import 'package:projeto_final/service/service_page_get.dart';
import 'package:projeto_final/service/service_page_update.dart';

import 'halter_app_icons.dart';

class AlteraTreino extends StatefulWidget {
  final Treino treino;
  final String email;
  const AlteraTreino({Key? key, required this.treino, required this.email}) : super(key: key);

  @override
  _AlteraTreinoState createState() => _AlteraTreinoState();
}

class _AlteraTreinoState extends State<AlteraTreino> {
  List<String> exercicios = [];

  List<Aluno> aluno = [];

  final service_update = ServicePageUpdate();
  final service_get  = ServicePageGet();

  final _formtreino = GlobalKey<FormState>();

  void enviaList() {
    _formtreino.currentState!.save();

    aluno = service_get.retornaAlunos();
    service_update.updateTreino(widget.treino, exercicios);
  }

  @override
  Widget build(BuildContext context) {
    service_get.getSpecificAluno(widget.email);
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: Text('Treino'),
        centerTitle: true,
        shadowColor: Colors.white,
        leading: Icon(Icons.account_balance_wallet),
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
                  widget.treino.nome,
                  style: TextStyle(
                      fontSize: 45, color: Colors.white, fontFamily: 'Pacifico'),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 10.0, bottom: 100.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 25.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 0.0, bottom: 0.0, left: 10),
                        child: TextFormField(
                          onSaved: (text) => exercicios.add(text.toString()),
                          style: TextStyle(color: Colors.white),
                          initialValue: widget.treino.exercicios[0],
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Exercício 1',
                              prefixIcon: const Icon(
                                HalterApp.dumbbell,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 0.0, bottom: 0.0, left: 10),
                        child: TextFormField(
                          onSaved: (text) => exercicios.add(text.toString()),
                          initialValue: widget.treino.exercicios[1],
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Exercício 2',
                              prefixIcon: const Icon(
                                HalterApp.dumbbell,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 0.0, bottom: 0.0, left: 10),
                        child: TextFormField(
                          onSaved: (text) => exercicios.add(text.toString()),
                          initialValue: widget.treino.exercicios[2],
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Exercício 3',
                              prefixIcon: const Icon(
                                HalterApp.dumbbell,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 0.0, bottom: 0.0, left: 10),
                        child: TextFormField(
                          onSaved: (text) => exercicios.add(text.toString()),
                          initialValue: widget.treino.exercicios[3],
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Exercício 4',
                              prefixIcon: const Icon(
                                HalterApp.dumbbell,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 0.0, bottom: 0.0, left: 10),
                        child: TextFormField(
                          onSaved: (text) => exercicios.add(text.toString()),
                          initialValue: widget.treino.exercicios[4],
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Exercício 5',
                              prefixIcon: const Icon(
                                HalterApp.dumbbell,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 140, vertical: 20)),
                        onPressed: () {
                          enviaList();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => App_InfoAluno(aluno: aluno.first)),
                          );
                        },
                        child: Text(
                          'Salvar',
                          style: TextStyle(
                              color: Colors.black, fontStyle: FontStyle.normal),
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
