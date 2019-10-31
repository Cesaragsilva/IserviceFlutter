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
  var categoriasLitradas = new List<Categoria>();

  _getCategorias() {
    API.getCategoria().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        categorias = lista.map((model) => Categoria.fromJson(model)).toList();
        categoriasLitradas = categorias;
      });
    });
  }

  _CardCategoriaState() {
    _getCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   backgroundColor: Color(0xFFf45d27),
      //   title: Text("Lista de Categoria"),
      // ),
      body: Column(
        children: <Widget>[
          Container(
            // margin: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 2.5,
            decoration: BoxDecoration(
              color: Color(0xFFf45d27),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100)),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFf45d27), Color(0xFFf5851f)]),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    'Categorias',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'Roboto'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: campoPesquisar((string) {
                        setState(() {
                          categoriasLitradas = categorias
                              .where((p) => p.nome
                                  .toUpperCase()
                                  .contains(string.toString().toUpperCase()))
                              .toList();
                        });
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.only(right: 20.0, left: 20.0),
                child: GridView.builder(
                    itemCount: categoriasLitradas.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return buildCard(categoriasLitradas[index]);
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

  Widget campoPesquisar(Function pesquisar) {
    return Container(
        width: MediaQuery.of(context).size.height / 2.2,
        height: 45,
        padding: EdgeInsets.only(top: 5, left: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 8),
            ]),
        child: Theme(
          child: TextField(
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 15.0),
            decoration: InputDecoration(
                hintText: 'O que você precisa?',
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Icon(Icons.search),
                ),
                border: InputBorder.none),
            onChanged: pesquisar,
          ),
          data: Theme.of(context).copyWith(primaryColor: Color(0xFFf5851f)),
        ));
  }
}
