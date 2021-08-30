import 'dart:convert';
import 'package:http/http.dart' as http;

class Professor {
  final String id;
  final String nome;
  final String idade;
  final String email;
  final String senha;
  final String telefone;
  final String endereco;
  final int cargo; // cargo 1 representa professor, 2 representa aluno

  Professor(
      {required this.id,
      required this.nome,
      required this.idade,
      required this.email,
      required this.telefone,
      required this.endereco,
      required this.cargo,
      required this.senha});

  void Cadastrar_professor(Professor newProfessor) {
    Uri url = Uri.parse(
        'https://daygym-fb-default-rtdb.firebaseio.com/professor.json');

    http.post(
      url,
      body: json.encode({
        'nome': newProfessor.nome,
        'idade': newProfessor.idade,
        'email': newProfessor.email,
        'senha': newProfessor.senha,
        'telefone': newProfessor.telefone,
        'endereco': newProfessor.endereco,
        'cargo': 2,
      }),
    );
  }
}
