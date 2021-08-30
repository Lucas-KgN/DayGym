import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Feedback_refeicao.dart';
import 'package:projeto_final/classes/Feedback_treino.dart';
import 'package:projeto_final/core/App_Feedback.dart';

class FeedbackAluno extends StatefulWidget {
  final List<Feedback_refeicao> feedbacks_dieta;
  final List<Feedback_treino> feedbacks_treino;

  const FeedbackAluno(
      {Key? key, required this.feedbacks_dieta, required this.feedbacks_treino})
      : super(key: key);

  @override
  _FeedbackAlunoState createState() => _FeedbackAlunoState();
}

class _FeedbackAlunoState extends State<FeedbackAluno> {
  List<String> lista = [];

  void getLista() {
    for (int i = 0; i < widget.feedbacks_treino.length; i++) {
      lista.add(widget.feedbacks_treino[i].texto);
    }

    for (int i = 0; i < widget.feedbacks_dieta.length; i++) {
      lista.add(widget.feedbacks_dieta[i].texto);
    }
  }

  @override
  Widget build(BuildContext context) {
    getLista();
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: Text('Feedbacks'),
        centerTitle: true,
        shadowColor: Colors.white,
        leading: Icon(Icons.account_box_outlined),
        leadingWidth: 50, // default is 56
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: widget.feedbacks_dieta.length +
                  widget.feedbacks_treino.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return new Card(
                  child: ListTile(
                    leading: Icon(Icons.assignment_ind_rounded),
                    title: Text('Feedback ${index + 1}'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                App_Feedback(texto: lista[index])),
                      );
                    },
                  ),
                );
              })),
    );
  }
}
