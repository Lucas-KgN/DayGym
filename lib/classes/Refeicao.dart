import 'dart:convert';
import 'package:http/http.dart' as http;

class Refeicao{
  final String id;
  final String nome;
  final List alimentos;
  final String id_aluno;

  Refeicao({required this.id, required this.nome, required this.alimentos, required this.id_aluno});

  void Cadastrar_refeicao(Refeicao newRefeicao){
    Uri url = Uri.parse('https://daygym-fb-default-rtdb.firebaseio.com/refeicao.json');

    http.post(
      url,
      body: json.encode({
        'nome': newRefeicao.nome,
        'alimentos': newRefeicao.alimentos,
        'id_aluno': newRefeicao.id_aluno
      }),
    );
  }

}