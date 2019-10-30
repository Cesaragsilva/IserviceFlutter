import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo/Entidades/categoria.dart';
import 'package:todo/Widget/campo_inicial.dart';
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
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width / 1.05,
            height: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
              color: Color(0xFFf45d27),
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFf45d27), Color(0xFFf5851f)]),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0).copyWith(top: 50),
              child: Row(
                children: <Widget>[
                  CampoInicial(
                    'Buscar',
                    Icons.search,
                    null,
                    largura: MediaQuery.of(context).size.height / 2.3,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.only(right: 20.0, left: 20.0),
                child: GridView.builder(
                    itemCount: categorias.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return buildCard(categorias[index]);
                    })),
          ),
        ],
      ),
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
