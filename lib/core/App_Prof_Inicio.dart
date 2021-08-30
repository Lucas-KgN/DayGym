import 'package:flutter/material.dart';
import 'package:projeto_final/presentation/Tela_Prof_Inicial.dart';

class Inicio_prof extends StatelessWidget {
  final String email;
  const Inicio_prof({Key? key, required this.email}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Gym',
      home: Tela_prof_inicio(email: email),
    );
  }
}
