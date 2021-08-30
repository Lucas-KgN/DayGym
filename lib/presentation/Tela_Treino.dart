import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Treino.dart';
import 'package:projeto_final/core/App_Dia_Treino.dart';
import 'package:projeto_final/service/service_page_get.dart';

import 'halter_app_icons.dart';

class UserTreino extends StatefulWidget {
  final String id_aluno;
  final String email;
  const UserTreino({Key? key, required this.id_aluno, required this.email})
      : super(key: key);

  @override
  _UserTreinoState createState() => _UserTreinoState();
}

class _UserTreinoState extends State<UserTreino> {
  final verificaEstado = GlobalKey<FormState>();

  final service = ServicePageGet();

  List<Treino> treino_aluno = [];

  void getTreinos() {
    verificaEstado.currentState!.save();

    treino_aluno = service.retornaTreinos();
  }

  @override
  Widget build(BuildContext context) {
    service.getTreinosAluno(widget.id_aluno);
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: Text('Day Gym'),
        centerTitle: true,
        shadowColor: Colors.white,
        leading: Icon(HalterApp.dumbbell),
        leadingWidth: 50, // default is 56
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: Form(
        key: verificaEstado,
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 0.0, right: 0.0, top: 0.0, bottom: 160.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Treinos',
                    style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontFamily: 'Pacifico'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 60.0, bottom: 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 132, vertical: 20)),
                          onPressed: () {
                            Timer(Duration(seconds: 2), () {
                              getTreinos();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Dia_Treino(treino: treino_aluno[0], email: widget.email)),
                              );
                            });
                          },
                          child: Text(
                            'Segunda Feira',
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Pacifico'),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 140, vertical: 20)),
                          onPressed: () {
                            Timer(Duration(seconds: 2), () {
                              getTreinos();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Dia_Treino(treino: treino_aluno[1], email: widget.email)),
                              );
                            });
                          },
                          child: Text(
                            'Terça Feira',
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Pacifico'),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 136, vertical: 20)),
                          onPressed: () {
                            Timer(Duration(seconds: 2), () {
                              getTreinos();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Dia_Treino(treino: treino_aluno[2], email: widget.email)),
                              );
                            });
                          },
                          child: Text(
                            'Quarta Feira',
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Pacifico'),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 137, vertical: 20)),
                          onPressed: () {
                            Timer(Duration(seconds: 2), () {
                              getTreinos();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Dia_Treino(treino: treino_aluno[3], email: widget.email)),
                              );
                            });
                          },
                          child: Text(
                            'Quinta Feira',
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Pacifico'),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 138, vertical: 20)),
                          onPressed: () {
                            Timer(Duration(seconds: 2), () {
                              getTreinos();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Dia_Treino(treino: treino_aluno[4], email: widget.email)),
                              );
                            });
                          },
                          child: Text(
                            'Sexta Feira',
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Pacifico'),
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
      ),
    );
  }
}
