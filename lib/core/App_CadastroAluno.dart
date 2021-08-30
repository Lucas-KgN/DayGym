import 'package:flutter/material.dart';
import 'package:projeto_final/presentation/Tela_CadastroAluno.dart';

class App_CadastroAluno extends StatelessWidget {
  final String id_prof;
  const App_CadastroAluno({Key? key, required this.id_prof}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Gym',
      home: CadastroAluno(id_prof: id_prof),
    );
  }
}
