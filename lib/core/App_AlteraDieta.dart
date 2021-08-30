import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Refeicao.dart';
import 'package:projeto_final/presentation/Tela_AlteraDieta.dart';

class App_AlteraDieta extends StatelessWidget {
  final Refeicao refeicao;
  final String email;
  const App_AlteraDieta({Key? key, required this.refeicao, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Gym',
      home: AlteraDieta(refeicao: refeicao, email: email),
    );
  }
}