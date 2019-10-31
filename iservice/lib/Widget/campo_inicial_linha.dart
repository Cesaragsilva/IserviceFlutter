import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CampoInicialLinha extends StatefulWidget {
  String texto;
  IconData icone;
  TextEditingController controller;
  double margin;
  double largura;
  bool textoSecreto;

  CampoInicialLinha(this.texto, this.icone, this.controller,
      {this.margin = 0, this.textoSecreto = false, this.largura = 300});

  @override
  _CampoInicialLinhaState createState() => _CampoInicialLinhaState();
}

class _CampoInicialLinhaState extends State<CampoInicialLinha> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.margin),
      width: widget.largura,
      child: Theme(
        child: TextField(
          obscureText: widget.textoSecreto,
          controller: widget.controller,
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 15.0),
          decoration: InputDecoration(
              hintText: widget.texto,
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Icon(widget.icone),
              )),
        ),
        data: Theme.of(context).copyWith(primaryColor: Color(0xFFf5851f)),
      ),
    );
  }
}
