import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Aluno.dart';
import 'package:projeto_final/core/App_NovaPesagem.dart';
import 'package:projeto_final/service/service_page_get.dart';

class Evolucao_aluno extends StatefulWidget {
  final Aluno aluno;
  const Evolucao_aluno({Key? key, required this.aluno}) : super(key: key);

  @override
  _Evolucao_alunoState createState() => _Evolucao_alunoState();
}

class _Evolucao_alunoState extends State<Evolucao_aluno> {
  final verificaEstado = GlobalKey<FormState>();

  double porcentagem = 0.0;

  final service_get = ServicePageGet();

  void calculaPorcentagem() {
    double peso;
    peso = widget.aluno.peso_atual - widget.aluno.peso_antigo;
    if (peso < 0) {
      peso *= -1;
    }
    porcentagem = (peso * 100) / widget.aluno.peso_atual;
  }

  @override
  Widget build(BuildContext context) {
    calculaPorcentagem();
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
      body: Form(
        key: verificaEstado,
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Evolução',
                  style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      fontFamily: 'Pacifico'),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 0.0, bottom: 150.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 0.0, top: 10.0, bottom: 70.0),
                        child: Column(
                          children: [
                            Text('Última pesagem realizada',
                                style: TextStyle(
                                    fontSize: 27,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal)),
                            SizedBox(height: 7),
                            Text(widget.aluno.peso_atual.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal)),
                            SizedBox(height: 40),
                            Text('Porcentagem de peso alcançada',
                                style: TextStyle(
                                    fontSize: 27,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal)),
                            SizedBox(height: 7),
                            Text(
                                porcentagem.toStringAsFixed(4)+'%',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal)),
                            SizedBox(height: 40),
                            Text('Data da última pesagem',
                                style: TextStyle(
                                    fontSize: 27,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal)),
                            SizedBox(height: 7),
                            Text(
                                widget.aluno
                                    .data,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 140, vertical: 20)),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    App_NovaPesagem(aluno: widget.aluno)),
                          );
                        },
                        child: Text(
                          'Nova Pesagem',
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
