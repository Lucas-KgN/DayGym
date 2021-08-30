import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Aluno.dart';
import 'package:projeto_final/classes/Refeicao.dart';
import 'package:projeto_final/core/App_InfoAluno.dart';
import 'package:projeto_final/service/service_page_get.dart';
import 'package:projeto_final/service/service_page_update.dart';

import 'halter_app_icons.dart';

class AlteraDieta extends StatefulWidget {
  final Refeicao refeicao;
  final String email;
  const AlteraDieta({Key? key, required this.refeicao, required this.email})
      : super(key: key);

  @override
  _AlteraDietaState createState() => _AlteraDietaState();
}

class _AlteraDietaState extends State<AlteraDieta> {
  List<String> alimentos = [];

  List<Aluno> aluno = [];

  final service_update = ServicePageUpdate();
  final service_get = ServicePageGet();

  final _formdieta = GlobalKey<FormState>();

  void enviaList() {
    _formdieta.currentState!.save();

    aluno = service_get.retornaAlunos();
    service_update.updateDieta(widget.refeicao, alimentos);
  }

  @override
  Widget build(BuildContext context) {
    service_get.getSpecificAluno(widget.email);
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: Text('Refeição'),
        centerTitle: true,
        shadowColor: Colors.white,
        leading: Icon(Icons.account_balance_wallet),
        leadingWidth: 50,
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: Form(
        key: _formdieta,
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.refeicao.nome,
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontFamily: 'Pacifico'),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 0.0, bottom: 110.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 25.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 0.0, bottom: 0.0, left: 10),
                        child: TextFormField(
                          initialValue: widget.refeicao.alimentos[0],
                          onSaved: (text) => alimentos.add(text.toString()),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Alimento 1',
                              prefixIcon: const Icon(
                                Icons.arrow_forward_rounded,
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
                          onSaved: (text) => alimentos.add(text.toString()),
                          initialValue: widget.refeicao.alimentos[1],
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Alimento 2',
                              prefixIcon: const Icon(
                                Icons.arrow_forward_rounded,
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
                          onSaved: (text) => alimentos.add(text.toString()),
                          initialValue: widget.refeicao.alimentos[2],
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Alimento 3',
                              prefixIcon: const Icon(
                                Icons.arrow_forward_rounded,
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
                          onSaved: (text) => alimentos.add(text.toString()),
                          initialValue: widget.refeicao.alimentos[3],
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Alimento 4',
                              prefixIcon: const Icon(
                                Icons.arrow_forward_rounded,
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
                          onSaved: (text) => alimentos.add(text.toString()),
                          initialValue: widget.refeicao.alimentos[4],
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Alimento 5',
                              prefixIcon: const Icon(
                                Icons.arrow_forward_rounded,
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
                                builder: (context) =>
                                    App_InfoAluno(aluno: aluno.first)),
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
