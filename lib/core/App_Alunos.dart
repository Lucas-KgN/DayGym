import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Aluno.dart';
import 'package:projeto_final/presentation/Tela_Prof_Alunos.dart';

class App_Alunos extends StatelessWidget {
  final List<Aluno> alunos_prof;

  const App_Alunos({Key? key, required this.alunos_prof}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Gym',
      home: Tela_Prof_Alunos(alunos_prof: alunos_prof),
    );
  }
}
