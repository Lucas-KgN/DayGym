import 'dart:convert';
import 'package:http/http.dart' as http;

class Feedback_treino{
  final String id;
  final String texto;
  final String id_aluno;
  final String id_treino;


  Feedback_treino({required this.id, required this.id_aluno, required this.texto, required this.id_treino});

  void Cadastrar_Feedback(Feedback_treino newFT){
    Uri url = Uri.parse('https://daygym-fb-default-rtdb.firebaseio.com/feedback_treino.json');

    http.post(
      url,
      body: json.encode({
        'texto': newFT.texto,
        'id_aluno': newFT.id_aluno,
        'id_treino': newFT.id_treino
      }),
    );
  }

}