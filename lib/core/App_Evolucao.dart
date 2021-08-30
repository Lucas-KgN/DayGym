import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Aluno.dart';
import 'package:projeto_final/presentation/Tela_Evolucao.dart';

class App_Evolucao extends StatelessWidget {
  final Aluno aluno;
  const App_Evolucao({Key? key, required this.aluno}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Gym',
      home: Evolucao_aluno(aluno: aluno),
    );
  }
}
