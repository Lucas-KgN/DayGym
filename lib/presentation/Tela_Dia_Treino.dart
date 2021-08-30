import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/classes/Treino.dart';
import 'package:projeto_final/core/App_Tela_Inicial_Aluno.dart';
import 'package:projeto_final/presentation/halter_app_icons.dart';
import 'package:projeto_final/service/service_page.dart';

class DiaTreino extends StatefulWidget {
  final Treino treino;
  final String email;
  const DiaTreino({Key? key, required this.treino, required this.email}) : super(key: key);

  @override
  _DiaTreinoState createState() => _DiaTreinoState();
}

class _DiaTreinoState extends State<DiaTreino> {

  final _mapFeedback = Map<String, Object>();

  final salvaFeedback = GlobalKey<FormState>();

  final service = ServicePage();

  void cadastraFeedback(){
    salvaFeedback.currentState!.save();

    _mapFeedback['id_aluno'] = widget.treino.id_aluno;
    _mapFeedback['id_treino'] = widget.treino.id;

    service.salvarFeedbackTreino(_mapFeedback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: Text('Day Gym'),
        centerTitle: true,
        shadowColor: Colors.white,
        leading: Icon(HalterApp.dumbbell),
        leadingWidth: 50,
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
                  widget.treino.nome,
                  style: TextStyle(
                      fontSize: 45, color: Colors.white, fontFamily: 'Pacifico'),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 10.0, bottom: 140.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 0.0, top: 15.0, bottom: 0.0),
                        child: Column(
                          children: [
                            Text(widget.treino.exercicios[0],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal)),
                            SizedBox(height: 7),
                            Text(widget.treino.exercicios[1],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal)),
                            SizedBox(height: 7),
                            Text(widget.treino.exercicios[2],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal)),
                            SizedBox(height: 7),
                            Text(widget.treino.exercicios[3],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal)),
                            SizedBox(height: 7),
                            Text(widget.treino.exercicios[4],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal)),
                          ],
                        ),
                      ),
                      SizedBox(height: 50.0),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 20.0, bottom: 40.0, left: 10),
                        child: TextField(
                          onChanged: (text) {
                            _mapFeedback['texto'] = text;
                          },
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
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
