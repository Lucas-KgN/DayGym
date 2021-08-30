import 'package:flutter/material.dart';
import 'package:projeto_final/presentation/Tela_CadastroDieta.dart';

class App_CadastroDieta extends StatelessWidget {
  final int i;
  final String titulo;
  final String? id_aluno;
  const App_CadastroDieta({required this.i, required this.titulo, String? id_aluno}) : this.id_aluno = id_aluno;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Gym',
      home:
      CadastroDieta(i: i, titulo: titulo, id_aluno: id_aluno),
    );
  }
}
