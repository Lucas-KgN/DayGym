import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Aluno.dart';
import 'package:projeto_final/classes/Autenticacao.dart';
import 'package:projeto_final/classes/Feedback_refeicao.dart';
import 'package:projeto_final/classes/Feedback_treino.dart';
import 'package:projeto_final/classes/Professor.dart';
import 'package:projeto_final/classes/Treino.dart';
import 'package:projeto_final/classes/Refeicao.dart';
import 'package:intl/intl.dart';

class ServicePage with ChangeNotifier {

  void salvarProfessor() {
    final newProfessor = Professor(
        id: '',
        nome: 'Felipe Gomes',
        idade: '32',
        email: 'felipeg@gmail.com',
        senha: 'senha123',
        telefone: '11948592043',
        endereco: 'Rua Piauí, 345, Medianeira',
        cargo: 2);

    final newAutenticacao = Autenticacao(
        id: '',
        email: 'felipeg@gmail.com',
        senha: 'senha123',
        cargo: 2);

        newProfessor.Cadastrar_professor (newProfessor);
        newAutenticacao.Cadastrar_Autenticacao(newAutenticacao);
  }

  void salvarAluno(Map data) {
    DateTime now = DateTime.now();
    String formatted = DateFormat('dd-MM-yyyy').format(now);

    final newAluno = Aluno(
        id: '',
        nome: data['nome'],
        idade: data['idade'],
        email: data['email'],
        telefone: data['telefone'],
        peso_atual: data['peso_atual'],
        id_prof: data['id_prof'],
        cargo: 1,
        senha: data['senha'],
        peso_antigo: 0.0,
        data: formatted);

    final newAutenticacao = Autenticacao(
        id: '',
        email: data['email'],
        senha: data['senha'],
        cargo: 1);

    newAluno.Cadastrar_aluno(newAluno);
    newAutenticacao.Cadastrar_Autenticacao(newAutenticacao);
  }

  void salvarTreino(Map data, List exercicios) {
    final newTreino = Treino(
        id: '',
        id_aluno: data['id_aluno'],
        nome: data['nome'],
        modalidade: data['modalidade'],
        exercicios: exercicios);

    newTreino.Cadastrar_treino(newTreino);
  }

  void salvarRefeicao(Map data, List alimentos) {
    final newRefeicao = Refeicao(
      id: '',
      nome: data['nome'],
      alimentos: alimentos,
      id_aluno: data['id_aluno'],
    );

    newRefeicao.Cadastrar_refeicao(newRefeicao);


  }

  void salvarFeedbackVazio(String id_aluno){
    final _mapFeedback = Map<String, Object>();
    _mapFeedback['texto'] = '';
    _mapFeedback['id_ref'] = '';
    _mapFeedback['id_aluno'] = id_aluno;
    _mapFeedback['id_treino'] = '';

    salvarFeedbackTreino(_mapFeedback);
    salvarFeedbackRefeicao(_mapFeedback);
  }

  void salvarFeedbackRefeicao(Map data) {
    final newFR = Feedback_refeicao(
      id: '',
      texto: data['texto'],
      id_ref: data['id_ref'],
      id_aluno: data['id_aluno'],
    );

    newFR.Cadastrar_Feedback(newFR);
  }

  void salvarFeedbackTreino(Map data) {
    final newFT = Feedback_treino(
      id: '',
      texto: data['texto'],
      id_aluno: data['id_aluno'],
      id_treino: data['id_treino']
    );

    newFT.Cadastrar_Feedback(newFT);
  }
}
