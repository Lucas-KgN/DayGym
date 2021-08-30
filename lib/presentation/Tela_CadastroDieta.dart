import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Aluno.dart';
import 'package:projeto_final/classes/Professor.dart';
import 'package:projeto_final/core/App_CadastroDieta.dart';
import 'package:projeto_final/core/App_Prof_Inicio.dart';
import 'package:projeto_final/service/service_page.dart';
import 'package:projeto_final/service/service_page_get.dart';

class CadastroDieta extends StatefulWidget {
  final int i;
  final String titulo;
  final String? id_aluno;
  const CadastroDieta({required this.i, required this.titulo, String? id_aluno})
      : this.id_aluno = id_aluno;

  @override
  _CadastroDietaState createState() => _CadastroDietaState();
}

class _CadastroDietaState extends State<CadastroDieta> {
  final _mapRefeicao = Map<String, Object>();

  List<Aluno> aluno = [];
  List<Professor> professores = [];

  String email = '';
  String id_aluno = '';

  final _formrefeicao = GlobalKey<FormState>();

  final service = ServicePage();

  final service_get = ServicePageGet();

  final List alimentos = [];

  void CadastraRefeicao() {
    _formrefeicao.currentState!.save();
    _mapRefeicao['id_aluno'] = widget.id_aluno.toString();
    professores = service_get.retornaProfessores();

    for (int i = 0; i < aluno.length; i++) {
      if (aluno[i].id == widget.id_aluno) {
        service.salvarFeedbackVazio(aluno[i].id);
        for (int j = 0; j < professores.length; j++) {
          if (aluno[i].id_prof == professores[j].id) {
            email = professores[j].email;
          }
        }
      }
    }
    service.salvarRefeicao(_mapRefeicao, alimentos);
  }

  @override
  Widget build(BuildContext context) {
    service_get.getAllAluno();
    service_get.getAllProfessores();
    Timer(Duration(seconds: 2), () {
      aluno = service_get.retornaAlunos();
    });
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: Text('Day Gym'),
        centerTitle: true,
        shadowColor: Colors.white,
        leading: Icon(Icons.web_rounded),
        leadingWidth: 50,
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: Form(
        key: _formrefeicao,
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
                      left: 0.0, right: 0.0, top: 0.0, bottom: 120.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 13.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 0.0, bottom: 0.0, left: 10),
                        child: TextFormField(
                          onSaved: (text) => alimentos.add(text),
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Alimento 1',
                              prefixIcon: const Icon(
                                Icons.emoji_food_beverage,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 0.0, bottom: 0.0, left: 10),
                        child: TextFormField(
                          onSaved: (text) => alimentos.add(text),
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Alimento 2',
                              prefixIcon: const Icon(
                                Icons.no_food_rounded,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 0.0, bottom: 0.0, left: 10),
                        child: TextFormField(
                          onSaved: (text) => alimentos.add(text),
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Alimento 3',
                              prefixIcon: const Icon(
                                Icons.food_bank,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 0.0, bottom: 0.0, left: 10),
                        child: TextFormField(
                          onSaved: (text) => alimentos.add(text),
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Alimento 4',
                              prefixIcon: const Icon(
                                Icons.album_rounded,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 0.0, bottom: 0.0, left: 10),
                        child: TextFormField(
                          onSaved: (text) => alimentos.add(text),
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Alimento 5',
                              prefixIcon: const Icon(
                                Icons.album_rounded,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 0.0, bottom: 0.0, left: 10),
                        child: TextField(
                          onChanged: (text) {
                            _mapRefeicao['nome'] = text;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Refeição',
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
                                horizontal: 138, vertical: 20)),
                        onPressed: () {
                          if (widget.i == -1) {
                            CadastraRefeicao();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => App_CadastroDieta(
                                      i: 1,
                                      titulo: 'Refeição 2',
                                      id_aluno: widget.id_aluno.toString())),
                            );
                          } else if (widget.i == 1) {
                            CadastraRefeicao();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => App_CadastroDieta(
                                      i: 2,
                                      titulo: 'Refeição 3',
                                      id_aluno: widget.id_aluno.toString())),
                            );
                          } else if (widget.i == 2) {
                            CadastraRefeicao();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Inicio_prof(email: email)),
                            );
                          }
                        },
                        child: Text(
                          'Confirmar',
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
