import 'package:flutter/material.dart';

class BotaoInicial extends StatelessWidget {
  Function comportamento;
  String texto;
  double marginTop;

  BotaoInicial(this.comportamento, this.texto, this.marginTop);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: marginTop, bottom: 50),
        child: ButtonTheme(
          minWidth: 300,
          splashColor: Color(0xFFf45d27),
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
          child: RaisedButton(
            color: Colors.white,
            child: Text(texto,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                    color: Color(0xFFf45d27))),
            onPressed: comportamento,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: BorderSide(color: Colors.deepOrange)),
          ),
        ));
  }
}