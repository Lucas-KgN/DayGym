import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Aluno.dart';
import 'package:projeto_final/core/App_Alunos.dart';
import 'package:projeto_final/core/App_CadastroAluno.dart';
import 'package:projeto_final/service/service_page_get.dart';

class Tela_prof_inicio extends StatefulWidget {
  final String email;
  const Tela_prof_inicio({Key? key, required this.email}) : super(key: key);

  @override
  _Tela_prof_inicioState createState() => _Tela_prof_inicioState();
}

class _Tela_prof_inicioState extends State<Tela_prof_inicio> {
  final verificaEstado = GlobalKey<FormState>();

  final service = ServicePageGet();

  List<Aluno> alunos_prof = [];

  bool state = false;

  String id_prof = '';

  void getIdProf() {
    verificaEstado.currentState!.save();

    id_prof = service.retornaIdProfessor();
  }

  void getAlunos() {
    verificaEstado.currentState!.save();

    id_prof = service.retornaIdProfessor();
    service.getAlunosProf(id_prof);
  }

  @override
  Widget build(BuildContext context) {
    service.getSpecificProfessor(widget.email);
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: Text('Olá Professor'),
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
                left: 0.0, right: 0.0, top: 0.0, bottom: 180.0),
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
                      left: 0.0, right: 0.0, top: 30.0, bottom: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 80),
                      if (state)
                        CircularProgressIndicator()
                      else
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 127, vertical: 20)),
                          onPressed: () {
                            state = true;
                            getAlunos();
                            Timer(Duration(seconds: 3), () {
                              state = false;
                              alunos_prof = service.retornaAlunos();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        App_Alunos(alunos_prof: alunos_prof)),
                              );
                            });
                          },
                          child: Text(
                            'Meus Alunos',
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Pacifico'),
                          ),
                        ),
                      SizedBox(height: 60),
                      if (state)
                        CircularProgressIndicator()
                      else
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 20)),
                          onPressed: () {
                            state = true;
                            getIdProf();
                            Timer(Duration(seconds: 3), () {
                              state = false;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        App_CadastroAluno(id_prof: id_prof)),
                              );
                            });
                          },
                          child: Text(
                            'Cadastrar Novo Aluno',
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
