import 'package:flutter/material.dart';
import 'package:todo/Widget/campo_inicial.dart';
import 'package:todo/Widget/inicio_tela.dart';

class RecuperarSenha extends StatefulWidget {
  @override
  _RecuperarSenhaState createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {
  final _ctrlEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        InicioTela(
          "IS",
          60,
          textoFilho: "Esqueci minha senha",
          tamanhoTextoFilho: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text(
            "Ops! Você esqueceu sua senha, mas como estamos por aqui vamos te ajudar, vamos recupera-lá pra você!",
            style: TextStyle(fontSize: 15),
          ),
        ),
        CampoInicial('Email', Icons.email, _ctrlEmail),
      ],
    ));
  }
}
