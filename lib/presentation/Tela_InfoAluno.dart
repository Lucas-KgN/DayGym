import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Aluno.dart';
import 'package:projeto_final/classes/Feedback_refeicao.dart';
import 'package:projeto_final/classes/Feedback_treino.dart';
import 'package:projeto_final/classes/Refeicao.dart';
import 'package:projeto_final/classes/Treino.dart';
import 'package:projeto_final/core/App_FeedbacksAluno.dart';
import 'package:projeto_final/core/App_TreinosAluno.dart';
import 'package:projeto_final/core/App_TreinosProf.dart';
import 'package:projeto_final/service/service_page_get.dart';

class InfoAluno extends StatefulWidget {
  final Aluno aluno;
  const InfoAluno({Key? key, required this.aluno}) : super(key: key);

  @override
  _InfoAlunoState createState() => _InfoAlunoState();
}

class _InfoAlunoState extends State<InfoAluno> {
  final verificaEstado = GlobalKey<FormState>();

  final service = ServicePageGet();

  List<Treino> treinos_aluno = [];
  List<Refeicao> dieta_aluno = [];
  List<Feedback_treino> feedbacks_treino = [];
  List<Feedback_refeicao> feedbacks_dieta = [];

  bool state = false;

  void getTreinos() {
    verificaEstado.currentState!.save();

    treinos_aluno = service.retornaTreinos();
  }

  void getDieta() {
    verificaEstado.currentState!.save();

    dieta_aluno = service.retornaDieta();
  }

  void getFeedback() {
    verificaEstado.currentState!.save();

    feedbacks_treino = service.getFeedbacksTreino();
    feedbacks_dieta = service.getFeedbacksDieta();
  }

  @override
  Widget build(BuildContext context) {
    service.getTreinosAluno(widget.aluno.id);
    service.getDietaAluno(widget.aluno.id);
    service.getFeedbackDieta(widget.aluno.id);
    service.getFeedbackTreino(widget.aluno.id);
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: Text('Day Gym'),
        centerTitle: true,
        shadowColor: Colors.white,
        leading: Icon(Icons.account_circle_rounded),
        leadingWidth: 50, // default is 56
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: Form(
        key: verificaEstado,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 0.0, right: 0.0, top: 0.0, bottom: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.aluno.nome,
                  style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      fontFamily: 'Pacifico'),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 90.0, bottom: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (state)
                        CircularProgressIndicator()
                      else
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 125, vertical: 20)),
                          onPressed: () {
                            state = true;
                            getTreinos();
                            Timer(Duration(seconds: 2), () {
                              state = false;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => App_TreinosAluno(
                                        treinos: treinos_aluno,
                                        email: widget.aluno.email)),
                              );
                            });
                          },
                          child: Text(
                            'Alterar Treino',
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Pacifico'),
                          ),
                        ),
                      SizedBox(height: 50),
                      if (state)
                        CircularProgressIndicator()
                      else
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 130, vertical: 20)),
                          onPressed: () {
                            state = true;
                            getDieta();
                            Timer(Duration(seconds: 2), () {
                              state = false;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => App_TreinosProf(
                                        dieta: dieta_aluno,
                                        email: widget.aluno.email)),
                              );
                            });
                          },
                          child: Text(
                            'Alterar Dieta',
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Pacifico'),
                          ),
                        ),
                      SizedBox(height: 50),
                      if (state)
                        CircularProgressIndicator()
                      else
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 140, vertical: 20)),
                          onPressed: () {
                            state = true;
                            Timer(Duration(seconds: 2), () {
                              getFeedback();
                              state = false;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => App_FeedbackAluno(
                                        feedbacks_treino: feedbacks_treino,
                                        feedbacks_dieta: feedbacks_dieta)),
                              );
                            });
                          },
                          child: Text(
                            'Feedbacks',
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
    );
  }
}
