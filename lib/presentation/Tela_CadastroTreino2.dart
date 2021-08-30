import 'package:flutter/material.dart';
import 'package:projeto_final/core/App_CadastroDieta.dart';
import 'package:projeto_final/core/App_CadastroTreino.dart';
import 'package:projeto_final/service/service_page.dart';

class CadastroTreino2 extends StatefulWidget {
  final List exercicios;
  final int i;
  final String titulo;
  final String id_aluno;

  const CadastroTreino2(
      {Key? key,
      required this.exercicios,
      required this.i,
      required this.titulo,
      required this.id_aluno})
      : super(key: key);

  @override
  _CadastroTreino2State createState() => _CadastroTreino2State();
}

class _CadastroTreino2State extends State<CadastroTreino2> {
  final _mapTreino = Map<String, Object>();

  final salvaTreino = GlobalKey<FormState>(); // Define o estado do formulario

  final service = ServicePage();

  void cadastraTreino() {
    salvaTreino.currentState!.save();

    _mapTreino['id_aluno'] = widget.id_aluno;
    service.salvarTreino(_mapTreino, widget.exercicios);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: Text('Day Gym'),
        centerTitle: true,
        shadowColor: Colors.white,
        leading: Icon(Icons.ad_units_sharp),
        leadingWidth: 50,
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: Form(
        key: salvaTreino,
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.titulo,
                  style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      fontFamily: 'Pacifico'),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 10.0, bottom: 220.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 0.0, top: 45.0, bottom: 0.0),
                        child: Column(
                          children: [
                            Text('Informações',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal)),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 20.0, bottom: 10.0, left: 10),
                        child: TextField(
                          onChanged: (text) {
                            _mapTreino['nome'] = text;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Nome',
                              prefixIcon: const Icon(
                                Icons.announcement_rounded,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 0.0, bottom: 0.0, left: 10),
                        child: TextField(
                          onChanged: (text) {
                            _mapTreino['modalidade'] = text;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Modalidade',
                              prefixIcon: const Icon(
                                Icons.account_balance_wallet_sharp,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 140, vertical: 20)),
                        onPressed: () {
                          if (widget.i == 1) {
                            cadastraTreino();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => App_CadastroTreino(
                                      i: 2,
                                      titulo: 'Treino 2',
                                      id_aluno: widget.id_aluno)),
                            );
                          } else if (widget.i == 2) {
                            cadastraTreino();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => App_CadastroTreino(
                                        i: 3,
                                        titulo: 'Treino 3',
                                        id_aluno: widget.id_aluno,
                                      )),
                            );
                          } else if (widget.i == 3) {
                            cadastraTreino();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => App_CadastroTreino(
                                        i: 4,
                                        titulo: 'Treino 4',
                                        id_aluno: widget.id_aluno,
                                      )),
                            );
                          } else if (widget.i == 4) {
                            cadastraTreino();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => App_CadastroTreino(
                                        i: 5,
                                        titulo: 'Treino 5',
                                        id_aluno: widget.id_aluno,
                                      )),
                            );
                          } else if (widget.i == 5) {
                            cadastraTreino();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => App_CadastroDieta(
                                      i: -1,
                                      titulo: 'Refeição 1',
                                      id_aluno: widget.id_aluno)),
                            );
                          }
                        },
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(
                              color: Colors.black, fontStyle: FontStyle.normal),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
