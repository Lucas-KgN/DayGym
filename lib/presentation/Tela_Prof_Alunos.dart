import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Aluno.dart';
import 'package:projeto_final/core/App_InfoAluno.dart';
import 'package:projeto_final/presentation/Tela_InfoAluno.dart';

class Tela_Prof_Alunos extends StatefulWidget {
  final List<Aluno> alunos_prof;
  const Tela_Prof_Alunos({Key? key, required this.alunos_prof})
      : super(key: key);

  @override
  _Tela_Prof_AlunosState createState() => _Tela_Prof_AlunosState();
}

class _Tela_Prof_AlunosState extends State<Tela_Prof_Alunos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: Text('Alunos'),
        centerTitle: true,
        shadowColor: Colors.white,
        leading: Icon(Icons.account_box_outlined),
        leadingWidth: 50, // default is 56
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: widget.alunos_prof.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return new Card(
                child: ListTile(
                  leading: Icon(Icons.assignment_ind),
                  title: Text(widget.alunos_prof[index].nome,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(widget.alunos_prof[index].idade + ' anos'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              App_InfoAluno(aluno: widget.alunos_prof[index])),
                    );
                  },
                ),
              );
            },
          )),
    );
  }
}
