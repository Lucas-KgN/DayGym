import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Aluno.dart';
import 'package:projeto_final/presentation/Tela_InfoAluno.dart';

class App_InfoAluno extends StatelessWidget {
  final Aluno aluno;
  const App_InfoAluno({Key? key, required this.aluno}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Gym',
      home: InfoAluno(aluno: aluno),
    );
  }
}
