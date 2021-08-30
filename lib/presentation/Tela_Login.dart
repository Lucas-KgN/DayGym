import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Autenticacao.dart';
import 'package:projeto_final/core/App_Prof_Inicio.dart';
import 'package:projeto_final/core/App_Tela_Inicial_Aluno.dart';
import 'package:projeto_final/presentation/halter_app_icons.dart';
import 'package:projeto_final/service/service_page.dart';
import 'package:projeto_final/service/service_page_get.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formLogin = GlobalKey<FormState>();

  final passwordControler = TextEditingController();

  final service = ServicePageGet();

  int verifica = 0;

  List<Autenticacao> logins = [];

  Map<String, String> _authData = {};

  bool islogin = false;

  verificaLogin() {
    logins = service.retornaLogins();

    if (logins.length > 0) {
      if (logins.first.email == _authData['email']) {
        if (logins.first.senha == _authData['senha']) {
          return logins.first.cargo;
        } else {
          return 0;
        }
      } else {
        return 0;
      }
    } else {
      return 0;
    }
  }

  void submit() {
    _formLogin.currentState!.save();

    service.getLogin(_authData['email'].toString());
    setState(() {
      islogin = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade700,
        body: Form(
          key: _formLogin,
          child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Day Gym',
                        style: TextStyle(
                            fontSize: 45,
                            color: Colors.white,
                            fontFamily: 'Pacifico'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 0.0, top: 0.0, bottom: 60.0),
                      child: Icon(HalterApp.dumbbell,
                          color: Colors.white, size: 45),
                    ),
                    TextFormField(
                      onSaved: (email) => _authData['email'] = email!,
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      validator: (_email) {
                        final email = _email ?? '';
                        if (email.trim().isEmpty || !email.contains('@')) {
                          return 'Informe um email válido';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      onSaved: (senha) => _authData['senha'] = senha!,
                      style: TextStyle(color: Colors.white),
                      controller: passwordControler,
                      obscureText: true,
                      validator: (_senha) {
                        final senha = _senha ?? '';
                        if (senha.isEmpty || senha.length < 5) {
                          return 'Informme uma senha válida';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Senha',
                          prefixIcon: const Icon(
                            Icons.animation,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: 18),
                    if (islogin)
                      CircularProgressIndicator()
                    else
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15)),
                        onPressed: () {
                          submit();
                          Timer(Duration(seconds: 2), () {
                            verifica = verificaLogin();
                            islogin = false;
                            if (verifica == 1) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Appuser1(
                                        email: _authData['email'].toString())),
                              );
                            } else if (verifica == 2) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Inicio_prof(
                                        email: _authData['email'].toString())),
                              );
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                        content: Text(
                                            'Dados fornecidos incorretos, por favor digite novamente.'),
                                        actions: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.white12,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 40,
                                                    vertical: 15)),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'Ok',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ));
                            }
                          });
                          //service.salvarProfessor();
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
