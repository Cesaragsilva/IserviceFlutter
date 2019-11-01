import 'package:flutter/material.dart';
import 'package:todo/Widget/logo.dart';

class InicioTela extends StatelessWidget {
  String texto;
  double tamanhoTexto;
  String textoFilho;
  double tamanhoTextoFilho;

  InicioTela(this.texto, this.tamanhoTexto,
      {this.textoFilho = '', tamanhoTextoFilho = 19});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Align(alignment: Alignment.center, child: Logo(50, 40)),
          Spacer(),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 32, bottom: 32),
                child: Text(textoFilho,
                    style: TextStyle(
                        color: Colors.white, fontSize: tamanhoTextoFilho)),
              )),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black87, blurRadius: 8),
          ],
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFf45d27), Color(0xFFf5851f)]),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
    );
  }
}
