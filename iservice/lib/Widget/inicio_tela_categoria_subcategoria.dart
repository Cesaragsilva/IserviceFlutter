import 'package:flutter/material.dart';
import 'package:todo/widget/campo_pesquisa.dart';

class InicioTelaCategoriaSubCategoria extends StatefulWidget {
  Function comportamento;
  String titulo;
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();

  InicioTelaCategoriaSubCategoria(this.titulo, this.comportamento,
      {this.scaffold = null});
  @override
  _InicioTelaCategoriaSubCategoriaState createState() =>
      _InicioTelaCategoriaSubCategoriaState();
}

class _InicioTelaCategoriaSubCategoriaState
    extends State<InicioTelaCategoriaSubCategoria> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 2.5,
      decoration: BoxDecoration(
        color: Color(0xFFf45d27),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 8),
        ],
        // borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.circular(100),
        //     bottomRight: Radius.circular(100)),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFf45d27), Color(0xFFf5851f)]),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 35.0, left: 15),
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
