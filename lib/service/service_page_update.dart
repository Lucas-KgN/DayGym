import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_final/classes/Aluno.dart';
import 'package:projeto_final/classes/Professor.dart';
import 'package:projeto_final/classes/Refeicao.dart';
import 'package:projeto_final/classes/Treino.dart';

class ServicePageUpdate with ChangeNotifier {

  void updateTreino(Treino oldtreino, List exercicios) {
    Uri url = Uri.parse(
        'https://daygym-fb-default-rtdb.firebaseio.com/treino/${oldtreino.id}.json');

    http.patch(
      url,
      body: json.encode({
        'nome': oldtreino.nome,
        'modalidade': oldtreino.modalidade,
        'exercicios': exercicios,
      }),
    );
  }

  void updateDieta(Refeicao olddieta, List alimentos) {
    Uri url = Uri.parse(
        'https://daygym-fb-default-rtdb.firebaseio.com/refeicao/${olddieta.id}.json');

    http.patch(
      url,
      body: json.encode({
        'nome': olddieta.nome,
        'alimentos': alimentos
      }),
    );
  }

  void updateEvolucao(Aluno aluno, double peso_antigo, double peso_atual) {
    Uri url = Uri.parse(
        'https://daygym-fb-default-rtdb.firebaseio.com/aluno/${aluno.id}.json');

    http.patch(
      url,
      body: json.encode({
        'peso_atual': peso_atual,
        'peso_antigo': peso_antigo
      }),
    );
  }


}
