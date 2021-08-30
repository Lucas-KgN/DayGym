import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Desc_Feedback extends StatefulWidget {
  final String texto;
  const Desc_Feedback({Key? key, required this.texto}) : super(key: key);

  @override
  _Desc_FeedbackState createState() => _Desc_FeedbackState();
}

class _Desc_FeedbackState extends State<Desc_Feedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        title: Text('Day Gym'),
        centerTitle: true,
        shadowColor: Colors.white,
        leading: Icon(Icons.accessibility_sharp),
        leadingWidth: 50, // default is 56
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 420.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 70.0),
                  child: Text(
                    'Feedback',
                    style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontFamily: 'Pacifico'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.texto,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontStyle: FontStyle.normal)),
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
