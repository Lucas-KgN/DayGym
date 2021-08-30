import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Feedback_refeicao.dart';
import 'package:projeto_final/classes/Feedback_treino.dart';
import 'package:projeto_final/presentation/Tela_FeedbackAluno.dart';

class App_FeedbackAluno extends StatelessWidget {
  final List<Feedback_refeicao> feedbacks_dieta;
  final List<Feedback_treino> feedbacks_treino;
  const App_FeedbackAluno({Key? key, required this.feedbacks_treino, required this.feedbacks_dieta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Day Gym',
  home: FeedbackAluno(feedbacks_dieta: feedbacks_dieta, feedbacks_treino: feedbacks_treino)
  );
  }
}
