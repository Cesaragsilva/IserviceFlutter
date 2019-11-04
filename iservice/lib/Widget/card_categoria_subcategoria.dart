import 'package:flutter/material.dart';

class CarCategoriaSubCategoria extends StatelessWidget {
  Function comportamento;
  String titulo;

  CarCategoriaSubCategoria(this.titulo, this.comportamento);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: comportamento,
        splashColor: Colors.deepOrange,
        child: Center(
          child: Column(
            children: <Widget>[
              Icon(
                Icons.add,
                size: 120,
                color: Color(0xFFf5851f),
              ),
              Text(
                titulo,
                style: TextStyle(color: Color(0xFFf45d27), fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
