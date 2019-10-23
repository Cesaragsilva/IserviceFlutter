import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo/subCategoria.dart';

import 'api.dart';
import 'categoria.dart';

class CardViewSubCategoria extends StatefulWidget {
  final Categoria categoria;

  CardViewSubCategoria(this.categoria);

  @override
  _CardViewSubCategoria createState() => _CardViewSubCategoria(categoria);
}

class _CardViewSubCategoria extends State<CardViewSubCategoria> {
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

  _CardViewSubCategoria(this.categoria) {
    _getCategorias(categoria.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Subcategorias"),
          backgroundColor: Colors.deepOrange,
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: GridView.builder(
            itemCount: subCategorias.length,  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),             
            itemBuilder: (context, index) {
              return listaSubCategoria(subCategorias[index]);
            },
          ),
        ));
  }

  listaSubCategoria(SubCategoria subCategoria) {
    return Card(
      child: InkWell(
        onTap: () {},
        splashColor: Colors.deepOrange,
        child: Center(
          child: Column(
            children: <Widget>[
              Icon(Icons.home), 
              Text(subCategoria.nome)
            ],
          ),          
        ),        
      ),      
    );
  }
}
