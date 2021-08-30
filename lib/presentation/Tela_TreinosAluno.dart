import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Treino.dart';
import 'package:projeto_final/core/App_AlteraTreino.dart';
import 'package:projeto_final/presentation/halter_app_icons.dart';

class TreinosAluno extends StatefulWidget {
  final List<Treino> treinos;
  final String email;
  const TreinosAluno({Key? key, required this.treinos, required this.email})
      : super(key: key);

  @override
  _TreinosAlunoState createState() => _TreinosAlunoState();
}

class _TreinosAlunoState extends State<TreinosAluno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: Text('Treinos'),
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
            itemCount: widget.treinos.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return new Card(
                child: ListTile(
                  leading: Icon(HalterApp.dumbbell),
                  title: Text(widget.treinos[index].nome,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(widget.treinos[index].modalidade),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              App_AlteraTreino(treino: widget.treinos[index], email: widget.email)),
                    );
                  },
                ),
              );
            },
          )),
    );
  }
}
