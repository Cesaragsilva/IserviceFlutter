import 'package:flutter/material.dart';

class CampoInicial extends StatefulWidget {
  String texto;
  IconData icone;
  TextEditingController controller;
  double margin;
  double largura;
  bool textoSecreto;
  TextInputType tipoTeclado;

  CampoInicial(this.texto, this.icone, this.controller,
      {this.margin = 0,
      this.tipoTeclado = TextInputType.text,
      this.textoSecreto = false,
      this.largura = 300});

  @override
  _CampoInicialState createState() => _CampoInicialState();
}

class _CampoInicialState extends State<CampoInicial> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.largura,
        height: 45,
        margin: EdgeInsets.only(top: widget.margin),
        padding: EdgeInsets.only(top: 5, left: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 8),
            ]),
        child: Theme(
          child: TextField(
            keyboardType: widget.tipoTeclado,
            obscureText: widget.textoSecreto,
            controller: widget.controller,
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 15.0),
            decoration: InputDecoration(
                hintText: widget.texto,
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Icon(widget.icone),
                ),
                border: InputBorder.none),
          ),
          data: Theme.of(context).copyWith(primaryColor: Color(0xFFf5851f)),
        ));
  }
}
