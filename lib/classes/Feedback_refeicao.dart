import 'dart:convert';
import 'package:http/http.dart' as http;

class Feedback_refeicao{
  final String id;
  final String texto;
  final String id_ref;
  final String id_aluno;

  Feedback_refeicao({required this.id, required this.id_ref, required this.id_aluno, required this.texto});

  void Cadastrar_Feedback(Feedback_refeicao newFR){
    Uri url = Uri.parse('https://daygym-fb-default-rtdb.firebaseio.com/feedback_refeicao.json');

    http.post(
      url,
      body: json.encode({
        'texto': newFR.texto,
        'id_ref': newFR.id_ref,
        'id_aluno': newFR.id_aluno,
      }),
    );
  }

}