import 'package:flutter/material.dart';
import 'package:projeto_final/presentation/Tela_Inicial_Aluno.dart';

class Appuser1 extends StatelessWidget {
  final String email;
  const Appuser1({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Gym',
      home: User1(email: email),
    );
  }
}
