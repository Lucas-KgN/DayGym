import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projeto_final/core/App_CadastroTreino.dart';
import 'package:projeto_final/service/service_page.dart';

class CadastroAluno extends StatefulWidget {
  final String id_prof;
  const CadastroAluno({Key? key, required this.id_prof}) : super(key: key);

  @override
  _CadastroAlunoState createState() => _CadastroAlunoState();
}

class _CadastroAlunoState extends State<CadastroAluno> {
  final _mapAluno = Map<String, Object>();

  final salvaAluno = GlobalKey<FormState>(); // Define o estado do formulario

  final service = ServicePage();

  var maskPeso = new MaskTextInputFormatter(mask: '##.##', filter: {'#': RegExp(r'[0-9]')});

  String email_aluno = '';

  void cadastraAluno() {
    salvaAluno.currentState!.save();
    _mapAluno['id_prof'] = widget.id_prof;

    service.salvarAluno(_mapAluno);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: Text('Day Gym'),
        centerTitle: true,
        shadowColor: Colors.white,
        leading: Icon(Icons.accessibility_sharp),
        leadingWidth: 50,
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: salvaAluno,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Novo Aluno',
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
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 0.0, bottom: 0.0, left: 10),
                        child: TextField(
                          onChanged: (text) {
                            _mapAluno['nome'] = text;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Nome',
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
                        child: TextField(
                          onChanged: (text) {
                            _mapAluno['idade'] = text;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Idade',
                              prefixIcon: const Icon(
                                Icons.android,
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
                        child: TextField(
                          onChanged: (text) {
                            _mapAluno['email'] = text;
                            email_aluno = text;
                          },
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: const Icon(
                                Icons.alternate_email,
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
                        child: TextField(
                          onChanged: (text) {
                            _mapAluno['telefone'] = text;
                          },
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              labelText: 'Telefone',
                              prefixIcon: const Icon(
                                Icons.phone,
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
                          onChanged: (text) {
                            _mapAluno['peso_atual'] = double.parse(text);
                          },
                          inputFormatters: [maskPeso],
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Peso Atual',
                              prefixIcon: const Icon(
                                Icons.ballot,
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
                        child: TextField(
                          onChanged: (text) {
                            _mapAluno['senha'] = text;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Senha',
                              prefixIcon: const Icon(
                                Icons.all_inclusive_sharp,
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
                          cadastraAluno();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => App_CadastroTreino(
                                    titulo: 'Treino 1', i: 1, email_aluno: email_aluno),
                          ));
                        },
                        child: Text(
                          'Cadastrar',
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
