import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Refeicao.dart';
import 'package:projeto_final/core/App_AlteraDieta.dart';

import 'halter_app_icons.dart';

class TreinosProf extends StatefulWidget {
  final List<Refeicao> dieta;
  final String email;
  const TreinosProf({Key? key, required this.dieta, required this.email}) : super(key: key);

  @override
  _TreinosProfState createState() => _TreinosProfState();
}

class _TreinosProfState extends State<TreinosProf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: Text('Refeições'),
        centerTitle: true,
        shadowColor: Colors.white,
        leading: Icon(Icons.all_inbox_rounded),
        leadingWidth: 50, // default is 56
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.wine_bar_outlined),
                title: Text(widget.dieta[0].nome),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            App_AlteraDieta(refeicao: widget.dieta[0], email: widget.email)),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.wine_bar_outlined),
                title: Text(widget.dieta[1].nome),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            App_AlteraDieta(refeicao: widget.dieta[1], email: widget.email)),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.wine_bar_outlined),
                title: Text(widget.dieta[2].nome),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            App_AlteraDieta(refeicao: widget.dieta[2], email: widget.email)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
