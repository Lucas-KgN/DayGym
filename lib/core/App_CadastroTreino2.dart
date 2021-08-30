import 'package:flutter/material.dart';
import 'package:projeto_final/presentation/Tela_CadastroTreino.dart';
import 'package:projeto_final/presentation/Tela_CadastroTreino2.dart';

class App_CadastroTreino2 extends StatelessWidget {
  final List exercicios;
  final int i;
  final String titulo;
  final String id_aluno;

  const App_CadastroTreino2({Key? key, required this.exercicios, required this.i, required this.titulo, required this.id_aluno}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Gym',
      home: CadastroTreino2(exercicios: exercicios, i: i, titulo: titulo, id_aluno: id_aluno),
    );
  }
}