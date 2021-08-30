import 'package:flutter/material.dart';
import 'package:projeto_final/presentation/Tela_Alimentacao.dart';

class Appuser2 extends StatelessWidget {
  final String id_aluno;
  final String email;
  const Appuser2({Key? key, required this.id_aluno, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Gym',
      home: User2(id_aluno: id_aluno, email: email),
    );
  }
}