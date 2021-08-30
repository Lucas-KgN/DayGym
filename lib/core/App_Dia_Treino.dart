import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Treino.dart';
import 'package:projeto_final/presentation/Tela_Dia_Treino.dart';

class Dia_Treino extends StatelessWidget {
  final Treino treino;
  final String email;
  const Dia_Treino({Key? key, required this.treino, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Gym',
      home: DiaTreino(treino: treino, email: email),
    );
  }
}
