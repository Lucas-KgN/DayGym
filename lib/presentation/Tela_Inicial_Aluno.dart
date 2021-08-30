import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Aluno.dart';
import 'package:projeto_final/core/App_Evolucao.dart';
import 'package:projeto_final/core/App_Tela_Alimentacao.dart';
import 'package:projeto_final/core/App_Treinos.dart';
import 'package:projeto_final/presentation/Tela_Treino.dart';
import 'package:projeto_final/service/service_page_get.dart';

class User1 extends StatefulWidget {
  final String email;
  const User1({Key? key, required this.email}) : super(key: key);

  @override
  User1State createState() => User1State();
}

class User1State extends State<User1> {
  final salvarEstado = GlobalKey<FormState>();

  final service = ServicePageGet();

  List<Aluno> aluno = [];

  String id_aluno = '';

  bool state = false;

  void getidAluno() {
    salvarEstado.currentState!.save();

    id_aluno = service.retornaIdAluno();
    aluno = service.retornaAlunos();
  }

  @override
  Widget build(BuildContext context) {
    service.getSpecificAluno(widget.email);
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: Text('Olá, seja bem vindo!'),
        centerTitle: true,
        shadowColor: Colors.white,
        leading: Icon(Icons.account_circle_rounded),
        leadingWidth: 50, // default is 56
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: Form(
        key: salvarEstado,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 0.0, right: 0.0, top: 0.0, bottom: 110.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Day Gym',
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
                            Timer(Duration(seconds: 2), () {
                              getidAluno();
                              state = false;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Appuser2(
                                        id_aluno: id_aluno,
                                        email: widget.email)),
                              );
                            });
                          },
                          child: Text(
                            'Alimentação',
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Pacifico'),
                          ),
                        ),
                      SizedBox(height: 50),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 140, vertical: 20)),
                        onPressed: () {
                          state = true;
                          Timer(Duration(seconds: 2), () {
                            getidAluno();
                            state = false;
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => AppTreino(
                                      id_aluno: id_aluno, email: widget.email)),
                            );
                          });
                        },
                        child: Text(
                          'Treino',
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'Pacifico'),
                        ),
                      ),
                      SizedBox(height: 50),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 134, vertical: 20)),
                        onPressed: () {
                          state = true;
                          Timer(Duration(seconds: 2), () {
                            getidAluno();
                            state = false;
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      App_Evolucao(aluno: aluno[0])),
                            );
                          });
                        },
                        child: Text(
                          'Evolução',
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
