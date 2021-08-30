import 'package:flutter/material.dart';
import 'package:projeto_final/presentation/Tela_Treino.dart';

class AppTreino extends StatelessWidget {
  final String id_aluno;
  final String email;
  const AppTreino({Key? key, required this.id_aluno, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Gym',
      home: UserTreino(id_aluno: id_aluno, email: email),
    );
  }
}
