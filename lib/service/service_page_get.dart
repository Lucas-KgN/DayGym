import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_final/classes/Aluno.dart';
import 'package:projeto_final/classes/Autenticacao.dart';
import 'package:projeto_final/classes/Feedback_refeicao.dart';
import 'package:projeto_final/classes/Feedback_treino.dart';
import 'package:projeto_final/classes/Professor.dart';
import 'package:projeto_final/classes/Refeicao.dart';
import 'package:projeto_final/classes/Treino.dart';

class ServicePageGet with ChangeNotifier {
  List<Professor> professores = [];
  List<Aluno> alunos = [];
  List<Treino> treinos = [];
  List<Refeicao> refeicoes = [];
  List<Feedback_treino> feedbacks_treino = [];
  List<Feedback_refeicao> feedbacks_dieta = [];
  List<Autenticacao> logins = [];

  String id_prof = '';
  String id_aluno = '';

  Future<void> getAllProfessores() async {
    Uri url = Uri.parse(
        'https://daygym-fb-default-rtdb.firebaseio.com/professor.json');

    final response = await http.get(url);
    Map<String, dynamic> dados = json.decode(response.body);
    professores.clear();

    if (dados != null) {
      dados.forEach((id, _mapprofessor) {
        professores.add(Professor(
            id: id,
            nome: _mapprofessor['nome'],
            idade: _mapprofessor['idade'],
            email: _mapprofessor['email'],
            telefone: _mapprofessor['telefone'],
            endereco: _mapprofessor['endereco'],
            cargo: _mapprofessor['cargo'],
            senha: _mapprofessor['senha']));
      });
      notifyListeners();
    }
    return Future.value();
  }

  Future<void> getSpecificProfessor(String email) async {
    Uri url = Uri.parse(
        'https://daygym-fb-default-rtdb.firebaseio.com/professor.json');

    final response = await http.get(url);
    Map<String, dynamic> dados = json.decode(response.body);
    professores.clear();

    if (dados != null) {
      dados.forEach((id, _mapprofessor) {
        if (_mapprofessor['email'] == email) {
          id_prof = id;
          professores.add(Professor(
              id: id,
              nome: _mapprofessor['nome'],
              idade: _mapprofessor['idade'],
              email: _mapprofessor['email'],
              telefone: _mapprofessor['telefone'],
              endereco: _mapprofessor['endereco'],
              cargo: _mapprofessor['cargo'],
              senha: _mapprofessor['senha']));
        }
      });
      notifyListeners();
    }
    return Future.value();
  }

  String retornaIdProfessor() {
    return id_prof;
  }

  List<Professor> retornaProfessores() {
    return professores;
  }

  Future<void> getAllAluno() async {
    Uri url =
        Uri.parse('https://daygym-fb-default-rtdb.firebaseio.com/aluno.json');

    final response = await http.get(url);
    Map<String, dynamic> dados = json.decode(response.body);
    alunos.clear();

    if (dados != null) {
      dados.forEach((id, _mapaluno) {
        if (_mapaluno['peso_antigo'] == null) {
          _mapaluno['peso_antigo'] = 0.0;
        }
        alunos.add(Aluno(
            id: id,
            nome: _mapaluno['nome'],
            idade: _mapaluno['idade'],
            email: _mapaluno['email'],
            telefone: _mapaluno['telefone'],
            peso_atual: _mapaluno['peso_atual'],
            id_prof: _mapaluno['id_prof'],
            cargo: _mapaluno['cargo'],
            senha: _mapaluno['senha'],
            peso_antigo: _mapaluno['peso_antigo'],
            data: _mapaluno['data']));
      });
      notifyListeners();
    }
    return Future.value();
  }

  Future<void> getSpecificAluno(String email) async {
    if (id_aluno != '') {
      return null;
    } else {
      Uri url =
          Uri.parse('https://daygym-fb-default-rtdb.firebaseio.com/aluno.json');

      final response = await http.get(url);
      Map<String, dynamic> dados = json.decode(response.body);
      alunos.clear();

      if (dados != null) {
        dados.forEach((id, _mapaluno) {
          if (_mapaluno['email'] == email) {
            id_aluno = id;
            alunos.add(Aluno(
                id: id,
                nome: _mapaluno['nome'],
                idade: _mapaluno['idade'],
                email: _mapaluno['email'],
                telefone: _mapaluno['telefone'],
                peso_atual: _mapaluno['peso_atual'],
                id_prof: _mapaluno['id_prof'],
                cargo: _mapaluno['cargo'],
                senha: _mapaluno['senha'],
                peso_antigo: _mapaluno['peso_antigo'],
                data: _mapaluno['data']));
          }
        });
        notifyListeners();
      }
    }
    return Future.value();
  }

  Future<void> getAlunosProf(String id_prof) async {
    Uri url =
        Uri.parse('https://daygym-fb-default-rtdb.firebaseio.com/aluno.json');

    final response = await http.get(url);
    Map<String, dynamic> dados = json.decode(response.body);
    alunos.clear();

    if (dados != null) {
      dados.forEach((id, _mapaluno) {
        if (_mapaluno['id_prof'] == id_prof) {
          alunos.add(Aluno(
              id: id,
              nome: _mapaluno['nome'],
              idade: _mapaluno['idade'],
              email: _mapaluno['email'],
              telefone: _mapaluno['telefone'],
              peso_atual: _mapaluno['peso_atual'],
              id_prof: _mapaluno['id_prof'],
              cargo: _mapaluno['cargo'],
              senha: _mapaluno['senha'],
              peso_antigo: _mapaluno['peso_antigo'],
              data: _mapaluno['data']));
        }
      });
      notifyListeners();
    }
    return Future.value();
  }

  List<Aluno> retornaAlunos() {
    return alunos;
  }

  String retornaIdAluno() {
    return id_aluno;
  }

  Future<void> getTreinosAluno(String id_aluno) async {
    Uri url =
        Uri.parse('https://daygym-fb-default-rtdb.firebaseio.com/treino.json');

    final response = await http.get(url);
    Map<String, dynamic> dados = json.decode(response.body);
    treinos.clear();

    if (dados != null) {
      dados.forEach((id, _maptreinos) {
        if (_maptreinos['id_aluno'] == id_aluno) {
          treinos.add(Treino(
              id: id,
              id_aluno: _maptreinos['id_aluno'],
              nome: _maptreinos['nome'],
              modalidade: _maptreinos['modalidade'],
              exercicios: _maptreinos['exercicios']));
        }
      });
      notifyListeners();
    }

    return Future.value();
  }

  List<Treino> retornaTreinos() {
    return treinos;
  }

  Future<void> getDietaAluno(String id_aluno) async {
    Uri url = Uri.parse(
        'https://daygym-fb-default-rtdb.firebaseio.com/refeicao.json');

    final response = await http.get(url);
    Map<String, dynamic> dados = json.decode(response.body);
    refeicoes.clear();

    if (dados != null) {
      dados.forEach((id, _mapdieta) {
        if (_mapdieta['id_aluno'] == id_aluno) {
          refeicoes.add(Refeicao(
              id: id,
              id_aluno: _mapdieta['id_aluno'],
              nome: _mapdieta['nome'],
              alimentos: _mapdieta['alimentos']));
        }
      });
      notifyListeners();
    }
    return Future.value();
  }

  List<Refeicao> retornaDieta() {
    return refeicoes;
  }

  Future<void> getFeedbackDieta(String id_aluno) async {
    Uri url = Uri.parse(
        'https://daygym-fb-default-rtdb.firebaseio.com/feedback_refeicao.json');

    final response = await http.get(url);
    Map<String, dynamic> dados = json.decode(response.body);
    feedbacks_dieta.clear();

    if (dados != null) {
      dados.forEach((id, _mapfeedback) {
        if (_mapfeedback['id_aluno'] == id_aluno) {
          feedbacks_dieta.add(Feedback_refeicao(
              id: id,
              id_ref: _mapfeedback['id_ref'],
              id_aluno: _mapfeedback['id_aluno'],
              texto: _mapfeedback['texto']));
        }
      });
      notifyListeners();
    } else {
      return Future.value();
    }
    return Future.value();
  }

  Future<void> getFeedbackTreino(String id_aluno) async {
    Uri url = Uri.parse(
        'https://daygym-fb-default-rtdb.firebaseio.com/feedback_treino.json');

    final response = await http.get(url);
    Map<String, dynamic> dados = json.decode(response.body);
    feedbacks_treino.clear();

    if (dados != null) {
      dados.forEach((id, _mapfeedback) {
        if (_mapfeedback['id_aluno'] == id_aluno) {
          feedbacks_treino.add(Feedback_treino(
              id: id,
              id_treino: _mapfeedback['id_treino'],
              id_aluno: _mapfeedback['id_aluno'],
              texto: _mapfeedback['texto']));
        }
      });
      notifyListeners();
    }
    return Future.value();
  }

  List<Feedback_refeicao> getFeedbacksDieta() {
    return feedbacks_dieta;
  }

  List<Feedback_treino> getFeedbacksTreino() {
    return feedbacks_treino;
  }

  Future<void> getLogin(String email) async {
    Uri url = Uri.parse(
        'https://daygym-fb-default-rtdb.firebaseio.com/autenticacao.json');

    final response = await http.get(url);
    Map<String, dynamic> dados = json.decode(response.body);
    logins.clear();

    if (dados != null) {
      dados.forEach((id, _maplogins) {
        if (_maplogins['email'] == email) {
          logins.add(Autenticacao(
              id: id,
              email: _maplogins['email'],
              cargo: _maplogins['cargo'],
              senha: _maplogins['senha']));
        }
      });
      notifyListeners();
    }
    return Future.value();
  }

  List<Autenticacao> retornaLogins() {
    return logins;
  }

}
