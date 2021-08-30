import 'dart:convert';
import 'package:http/http.dart' as http;

class Aluno {
  final String id;
  final String nome;
  final String idade;
  final String email;
  final String telefone;
  final double peso_atual;
  final String id_prof;
  final String senha;
  final String data;
  final int cargo; // cargo 1 representa professor, 2 representa aluno
  final double peso_antigo;

  Aluno({required this.id, required this.nome, required this.idade, required this.email, required this.telefone, required this.peso_atual, required this.id_prof, required this.cargo, required this.senha, required this.data, required this.peso_antigo});


  void Cadastrar_aluno(Aluno newAluno){
    Uri url = Uri.parse('https://daygym-fb-default-rtdb.firebaseio.com/aluno.json');

  http.post(
    url,
    body: json.encode({
      'nome': newAluno.nome,
      'idade': newAluno.idade,
      'email': newAluno.email,
      'telefone': newAluno.telefone,
      'peso_atual': newAluno.peso_atual,
      'cargo': 1,
      'id_prof': newAluno.id_prof,
      'senha': newAluno.senha,
       'data': newAluno.data,
      'peso_antigo': 0.0
    }),
  );
  }

}