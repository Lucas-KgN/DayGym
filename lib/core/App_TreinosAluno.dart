import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Treino.dart';
import 'package:projeto_final/presentation/Tela_TreinosAluno.dart';

class App_TreinosAluno extends StatelessWidget {
  final List<Treino> treinos;
  final String email;
  const App_TreinosAluno({Key? key, required this.treinos, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Gym',
      home: TreinosAluno(treinos: treinos, email: email),
    );
  }
}
