import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Treino.dart';
import 'package:projeto_final/presentation/Tela_AlteraTreino.dart';

class App_AlteraTreino extends StatelessWidget {
  final Treino treino;
  final String email;
  const App_AlteraTreino({Key? key, required this.treino, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Gym',
      home: AlteraTreino(treino: treino, email: email),
    );
  }
}
