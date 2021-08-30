import 'package:flutter/material.dart';
import 'package:projeto_final/presentation/Tela_CadastroTreino.dart';

class App_CadastroTreino extends StatelessWidget {
  final int i;
  final String titulo;
  final String? email_aluno;
  final String? id_aluno;

  const App_CadastroTreino({required this.i, required this.titulo, String? email_aluno, String? id_aluno}) : this.email_aluno = email_aluno, this.id_aluno = id_aluno;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Gym',
      home: CadastroTreino(i: i, titulo: titulo, email_aluno: email_aluno, id_aluno: id_aluno),
    );
  }
}
