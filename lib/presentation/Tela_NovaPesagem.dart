import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Aluno.dart';
import 'package:projeto_final/core/App_Tela_Inicial_Aluno.dart';
import 'package:projeto_final/service/service_page_update.dart';
import 'halter_app_icons.dart';

class NovaPesagem extends StatefulWidget {
  final Aluno aluno;
  const NovaPesagem({Key? key, required this.aluno}) : super(key: key);

  @override
  _NovaPesagemState createState() => _NovaPesagemState();
}

class _NovaPesagemState extends State<NovaPesagem> {
  final service_update = ServicePageUpdate();

  final _formevo = GlobalKey<FormState>();

  double novo_peso = 0.0;
  double peso_antigo = 0.0;

  void enviaEvo() {
    _formevo.currentState!.save();

    peso_antigo = widget.aluno.peso_atual;

    service_update.updateEvolucao(widget.aluno, peso_antigo, novo_peso);
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
        key: _formevo,
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Nova Pesagem',
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
                        child: TextFormField(
                          onSaved: (text) =>
                              novo_peso = double.parse(text.toString()),
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Peso',
                              prefixIcon: const Icon(
                                Icons.announcement_rounded,
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
                          enviaEvo();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => Appuser1(email: widget.aluno.email)),
                          );
                        },
                        child: Text(
                          'Enviar',
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
