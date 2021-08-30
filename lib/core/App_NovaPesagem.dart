import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Aluno.dart';
import 'package:projeto_final/presentation/Tela_NovaPesagem.dart';

class App_NovaPesagem extends StatelessWidget {
  final Aluno aluno;
  const App_NovaPesagem({Key? key, required this.aluno}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NovaPesagem(aluno: aluno);
  }
}
