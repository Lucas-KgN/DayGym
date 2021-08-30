import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Refeicao.dart';
import 'package:projeto_final/presentation/Tela_TreinosProf.dart';

class App_TreinosProf extends StatelessWidget {
  final List<Refeicao> dieta;
  final String email;
  const App_TreinosProf({Key? key, required this.dieta, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Gym',
      home: TreinosProf(dieta: dieta, email: email),
    );
  }
}
