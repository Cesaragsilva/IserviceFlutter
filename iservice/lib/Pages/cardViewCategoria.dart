import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo/Entidades/categoria.dart';
import 'package:todo/entidades/usuario.dart';
import 'package:todo/services/api.dart';
import 'package:todo/widget/campo_pesquisa.dart';
import 'package:todo/widget/card_categoria_subcategoria.dart';
import 'package:todo/widget/inicio_tela_categoria_subcategoria.dart';
import 'package:todo/widget/menu.dart';
import 'cardViewSubCategoria.dart';

class CardCategoria extends StatefulWidget {
  @override
  _CardCategoriaState createState() => _CardCategoriaState();
}

class _CardCategoriaState extends State<CardCategoria> {
  var categorias = new List<Categoria>();
  var categoriasLitradas = new List<Categoria>();

  _getCategorias() {
    if (Usuario.usuario == "teste") {
      categorias.add(Categoria(nome: "Técnico", id: "1"));
      categorias.add(Categoria(nome: "Eventos", id: "2"));
      categorias.add(Categoria(nome: "Educação", id: "3"));
      categorias.add(Categoria(nome: "Saúde", id: "4"));
      categorias.add(Categoria(nome: "Beleza", id: "5"));
      categorias.add(Categoria(nome: "Reformas", id: "6"));
      categoriasLitradas = categorias;
      return;
    }

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
    var _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: Menu(),
      body: Column(
        children: <Widget>[
          inicioTelaCategoria(_scaffoldKey),
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

  inicioTelaCategoria(GlobalKey<ScaffoldState> _scaffoldKey) {
    return InicioTelaCategoriaSubCategoria(
      "Categorias",
      (string) {
        setState(() {
          categoriasLitradas = categorias
              .where((p) => p.nome
                  .toUpperCase()
                  .contains(string.toString().toUpperCase()))
              .toList();
        });
      },
      scaffold: _scaffoldKey,
    );
  }

  buildCard(Categoria categoria) {
    return CarCategoriaSubCategoria(categoria.nome, () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CardViewSubCategoria(categoria)));
    });
  }
}
