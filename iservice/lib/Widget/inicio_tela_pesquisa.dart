import 'package:flutter/material.dart';
import 'package:todo/utilidades/styles.dart';
import 'package:todo/widget/campo_pesquisa.dart';

class InicioTelaPesquisa extends StatefulWidget {
  Function comportamento;
  String titulo;
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();

  InicioTelaPesquisa(this.titulo, this.comportamento, {this.scaffold = null});
  @override
  _InicioTelaPesquisa createState() => _InicioTelaPesquisa();
}

class _InicioTelaPesquisa extends State<InicioTelaPesquisa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 2.5,
      decoration: boxDecorationLaranjaDegrade,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 35.0,
              left: 15,
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Text(
                    widget.titulo,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CampoPesquisa(widget.comportamento)),
            ],
          ),
        ],
      ),
    );
  }
}
