import 'package:flutter/material.dart';

class AreaTexto extends StatefulWidget {
  String texto;
  IconData icone;
  TextEditingController controller;
  double margin;
  bool textoSecreto;
  TextInputType tipoTeclado;

  AreaTexto(this.texto, this.icone, this.controller,
      {this.margin = 0,
      this.tipoTeclado = TextInputType.text,
      this.textoSecreto = false});

  @override
  _AreaTextoState createState() => _AreaTextoState();
}

class _AreaTextoState extends State<AreaTexto> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 1.1,
        margin: EdgeInsets.only(top: widget.margin),
        padding: EdgeInsets.only(top: 5, left: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 3,
                offset: Offset.fromDirection(1),
              ),
            ]),
        child: Theme(
          child: TextField(
            maxLines: 5,
            keyboardType: widget.tipoTeclado,
            obscureText: widget.textoSecreto,
            controller: widget.controller,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15.0,
            ),
            decoration: InputDecoration(
              hintText: widget.texto,
              border: InputBorder.none,
            ),
          ),
          data: Theme.of(context).copyWith(primaryColor: Color(0xFFf5851f)),
        ));
  }
}
