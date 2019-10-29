import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo/Entidades/categoria.dart';
import 'package:todo/services/api.dart';
import 'cardViewSubCategoria.dart';

class CardCategoria extends StatefulWidget {
  @override
  _CardCategoriaState createState() => _CardCategoriaState();
}

class _CardCategoriaState extends State<CardCategoria> {
  var categorias = new List<Categoria>();

  _getCategorias() {
    API.getCategoria().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        categorias = lista.map((model) => Categoria.fromJson(model)).toList();
      });
    });
  }

  _CardCategoriaState() {
    _getCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFFf45d27),
        title: Text("Lista de Categoria"),
      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: GridView.builder(
              itemCount: categorias.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return buildCard(categorias[index]);
              })),
    );
  }

  buildCard(Categoria categoria) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CardViewSubCategoria(categoria)));
        },
        splashColor: Colors.deepOrange,
        child: Center(
          child: Column(
            children: <Widget>[Icon(Icons.home), Text(categoria.nome)],
          ),
        ),
      ),
    );
  }
}
