import 'package:flutter/material.dart';
import 'package:projeto_final/presentation/Tela_Login.dart';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Gym',
      home: LoginPage(),
    );
  }
}
