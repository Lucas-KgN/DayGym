import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Refeicao.dart';
import 'package:projeto_final/core/App_Refeicao.dart';
import 'package:projeto_final/service/service_page_get.dart';

class User2 extends StatefulWidget {
  final String id_aluno;
  final String email;
  const User2({Key? key, required this.id_aluno, required this.email}) : super(key: key);

  @override
  User2State createState() => User2State();
}

class User2State extends State<User2> {
  final verificaEstado = GlobalKey<FormState>();

  final service = ServicePageGet();

  List<Refeicao> dieta_aluno = [];

  bool state = false;

  void getDieta() {
    verificaEstado.currentState!.save();

    dieta_aluno = service.retornaDieta();
  }

  @override
  Widget build(BuildContext context) {
    service.getDietaAluno(widget.id_aluno);
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: Text('Day Gym'),
        centerTitle: true,
        shadowColor: Colors.white,
        leading: Icon(Icons.fastfood),
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
                left: 0.0, right: 0.0, top: 0.0, bottom: 110.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Alimentação',
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
                                  horizontal: 140, vertical: 20)),
                          onPressed: () {
                            state = true;
                            Timer(Duration(seconds: 2), () {
                              getDieta();
                              state = false;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => AppRefeicao(refeicao: dieta_aluno[0], email: widget.email)),
                              );
                            });
                          },
                          child: Text(
                            'Refeição 1',
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
                              getDieta();
                              state = false;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => AppRefeicao(refeicao: dieta_aluno[1], email: widget.email)),
                              );
                            });
                          },
                          child: Text(
                            'Refeição 2',
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
                              getDieta();
                              state = false;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => AppRefeicao(refeicao: dieta_aluno[2], email: widget.email)),
                              );
                            });
                          },
                          child: Text(
                            'Refeição 3',
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
