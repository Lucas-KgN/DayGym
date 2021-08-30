import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Refeicao.dart';
import 'package:projeto_final/presentation/Tela_Refeicao.dart';

class AppRefeicao extends StatelessWidget {
  final Refeicao refeicao;
  final String email;
  const AppRefeicao({Key? key, required this.refeicao, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Gym',
      home: User3(refeicao: refeicao, email: email),
    );
  }
}
