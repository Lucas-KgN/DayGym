import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_final/classes/Refeicao.dart';
import 'package:projeto_final/core/App_Tela_Inicial_Aluno.dart';
import 'package:projeto_final/service/service_page.dart';

class User3 extends StatefulWidget {
  final Refeicao refeicao;
  final String email;
  const User3({Key? key, required this.refeicao, required this.email}) : super(key: key);

  @override
  _User3State createState() => _User3State();
}

class _User3State extends State<User3> {

  final _mapFeedback = Map<String, Object>();

  final salvaFeedback = GlobalKey<FormState>();

  final service = ServicePage();

  void cadastraFeedback(){
    salvaFeedback.currentState!.save();

    _mapFeedback['id_ref'] = widget.refeicao.id;
    _mapFeedback['id_aluno'] = widget.refeicao.id_aluno;

    service.salvarFeedbackRefeicao(_mapFeedback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: Text('Day Gym'),
        centerTitle: true,
        shadowColor: Colors.white,
        leading: Icon(Icons.fastfood),
        leadingWidth: 50, // default is 56
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: Form(
        key: salvaFeedback,
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.refeicao.nome,
                  style: TextStyle(
                      fontSize: 45, color: Colors.white, fontFamily: 'Pacifico'),
                ),
                SizedBox(height: 25.0),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 0.0, bottom: 170.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 0.0, top: 10.0, bottom: 0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.refeicao.alimentos[0],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal)),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0.0, right: 10.0, top: 0.0, bottom: 0.0),
                              child: Text(widget.refeicao.alimentos[1],
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontStyle: FontStyle.normal)),
                            ),
                            SizedBox(height: 5),
                            Text(widget.refeicao.alimentos[2],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal)),
                            SizedBox(height: 5),
                            Text(widget.refeicao.alimentos[3],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal)),
                            SizedBox(height: 5),
                            Text(widget.refeicao.alimentos[4],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal)),
                          ],
                        ),
                      ),
                      SizedBox(height: 70.0),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 0.0, bottom: 50.0, left: 10),
                        child: TextField(
                          onChanged: (text) {
                            _mapFeedback['texto'] = text;
                          },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(98),
                            ],
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Feedback',
                              prefixIcon: const Icon(
                                Icons.announcement_rounded,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 140, vertical: 20)),
                        onPressed: () {
                          cadastraFeedback();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => Appuser1(email: widget.email)),
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
