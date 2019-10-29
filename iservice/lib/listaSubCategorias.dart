import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo/services/api.dart';

import 'Entidades/categoria.dart';
import 'Entidades/subCategoria.dart';

class ListaSubCategoria extends StatefulWidget {
  final Categoria categoria;

  ListaSubCategoria(this.categoria);

  @override
  _ListaSubCategoria createState() => _ListaSubCategoria(categoria);
}

class _ListaSubCategoria extends State<ListaSubCategoria> {
  final Categoria categoria;

  var subCategorias = new List<SubCategoria>();

  _getCategorias(String id) {
    API.getSubCategoria(id).then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        subCategorias =
            lista.map((model) => SubCategoria.fromJson(model)).toList();
      });
    });
  }

  _ListaSubCategoria(this.categoria) {
    _getCategorias(categoria.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Subcategorias"),
          backgroundColor: Colors.deepOrange,
        ),
        body: listaSubCategoria());
  }

  listaSubCategoria() {return ListView.builder(
      itemCount: subCategorias.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            subCategorias[index].nome,
            style: TextStyle(fontSize: 20.0, color: Colors.deepOrange),
          ),
        );
      },
    );}
}
