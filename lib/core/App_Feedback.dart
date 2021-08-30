import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Feedback_refeicao.dart';
import 'package:projeto_final/classes/Feedback_treino.dart';
import 'package:projeto_final/presentation/Tela_Feedback.dart';

class App_Feedback extends StatelessWidget {
  final String texto;

  const App_Feedback(
      {Key? key, required this.texto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Gym',
      home: Desc_Feedback(texto: texto),
    );
  }
}
