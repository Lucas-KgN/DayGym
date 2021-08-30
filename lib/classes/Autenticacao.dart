import 'dart:convert';
import 'package:http/http.dart' as http;

class Autenticacao {
  final String id;
  final String email;
  final String senha;
  final int cargo;

  Autenticacao(
      {required this.id,
      required this.email,
      required this.senha,
      required this.cargo});

  void Cadastrar_Autenticacao(Autenticacao newAutenticacao) {
    Uri url = Uri.parse(
        'https://daygym-fb-default-rtdb.firebaseio.com/autenticacao.json');

    http.post(
      url,
      body: json.encode({
        'email': newAutenticacao.email,
        'senha': newAutenticacao.senha,
        'cargo': newAutenticacao.cargo
      }),
    );
  }
}
