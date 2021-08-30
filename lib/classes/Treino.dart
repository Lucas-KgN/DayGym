import 'package:http/http.dart' as http;
import 'dart:convert';

class Treino{
  final String id;
  final String id_aluno;
  final String nome;
  final String modalidade;
  final List exercicios;

  Treino({required this.id, required this.id_aluno, required this.nome, required this.modalidade, required this.exercicios});

  void Cadastrar_treino(Treino newTreino){
    Uri url = Uri.parse('https://daygym-fb-default-rtdb.firebaseio.com/treino.json');

    http.post(
      url,
      body: json.encode({
        'id_aluno': newTreino.id_aluno,
        'nome': newTreino.nome,
        'modalidade': newTreino.modalidade,
        'exercicios': newTreino.exercicios,
      }),
    );
  }

}
