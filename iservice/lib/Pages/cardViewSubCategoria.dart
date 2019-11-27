import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo/Entidades/categoria.dart';
import 'package:todo/Entidades/subCategoria.dart';
import 'package:todo/entidades/usuario.dart';
import 'package:todo/pages/lista_servico.dart';
import 'package:todo/services/api.dart';
import 'package:todo/widget/card_categoria_subcategoria.dart';
import 'package:todo/widget/inicio_tela_pesquisa.dart';
import 'package:todo/widget/scaffold_customizado.dart';

class CardViewSubCategoria extends StatefulWidget {
  final Categoria categoria;

  CardViewSubCategoria(this.categoria);

  @override
  _CardViewSubCategoria createState() => _CardViewSubCategoria(categoria);
}

class _CardViewSubCategoria extends State<CardViewSubCategoria> {
  final Categoria categoria;

  var subCategorias = new List<SubCategoria>();
  var subCategoriasFiltradas = new List<SubCategoria>();

  _getCategorias(String id) {
    if (Usuario.usuario == "teste") {
      subCategorias.add(SubCategoria(nome: "Técnico", idCategoria: "1"));
      subCategorias.add(SubCategoria(nome: "Eventos", idCategoria: "2"));
      subCategorias.add(SubCategoria(nome: "Educação", idCategoria: "3"));
      subCategorias.add(SubCategoria(nome: "Saúde", idCategoria: "4"));
      subCategorias.add(SubCategoria(nome: "Beleza", idCategoria: "5"));
      subCategorias.add(SubCategoria(nome: "Reformas", idCategoria: "6"));
      subCategoriasFiltradas = subCategorias;
      return;
    }

    API.getSubCategoria(id).then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        subCategorias =
            lista.map((model) => SubCategoria.fromJson(model)).toList();
        subCategoriasFiltradas = subCategorias;
      });
    });
  }

  _CardViewSubCategoria(this.categoria) {
    _getCategorias(categoria.id);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustomizado(buildCorpo());
  }

  buildCorpo() {
    return Column(
      children: <Widget>[
        inicioTelaSubCategoria(),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(right: 20.0, left: 20.0),
            child: GridView.builder(
              itemCount: subCategoriasFiltradas.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return listaSubCategoria(subCategoriasFiltradas[index]);
              },
            ),
          ),
        ),
      ],
    );
  }

  inicioTelaSubCategoria() {
    return InicioTelaPesquisa("SubCategorias", (string) {
      setState(() {
        subCategoriasFiltradas = subCategorias
            .where((p) =>
                p.nome.toUpperCase().contains(string.toString().toUpperCase()))
            .toList();
      });
    });
  }

  listaSubCategoria(SubCategoria subCategoria) {
    return CarCategoriaSubCategoria(subCategoria.nome, () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ListaServico(subCategoria.id)));
    });
  }
}
