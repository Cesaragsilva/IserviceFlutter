import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo/entidades/resumo_servico.dart';
import 'package:todo/entidades/usuario.dart';
import 'package:todo/pages/detalhes_servico.dart';
import 'package:todo/services/api.dart';
import 'package:todo/widget/inicio_tela_pesquisa.dart';
import 'package:todo/widget/scaffold_customizado.dart';

class ListaServico extends StatefulWidget {
  String idSubCategoria;

  ListaServico(this.idSubCategoria);
  @override
  _ListaServicoState createState() => _ListaServicoState(idSubCategoria);
}

class _ListaServicoState extends State<ListaServico> {
  List<ResumoServico> servicos = new List<ResumoServico>();
  List<ResumoServico> servicosFiltrados = new List<ResumoServico>();

  _ListaServicoState(String id) {
    _getServicos(id);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustomizado(
      Column(
        children: <Widget>[
          inicioTelaCategoria(),
          buildListaServico(),
        ],
      ),
    );
  }

  inicioTelaCategoria() {
    return InicioTelaPesquisa("Servicos", (string) {
      setState(() {
        servicosFiltrados = servicos
            .where((p) =>
                p.nome.toUpperCase().contains(string.toString().toUpperCase()))
            .toList();
      });
    });
  }

  _getServicos(String id) {
    if (Usuario.usuario == "teste") {
      servicos.add(new ResumoServico(
        nome: "Técnico",
        id: "1",
        nota: 5,
        descricao: "formato seu Pc e passo borracha na memória",
        cidade: "Praia Grande",
        telefone: "(13) 3333 - 3333",
      ));
      servicos.add(ResumoServico(
        nome: "Micreiro",
        id: "1",
        nota: 5,
        descricao: "formato seu Pc e passo borracha na memória",
        cidade: "Praia Grande",
        telefone: "(13) 3333 - 3333",
      ));
      servicos.add(ResumoServico(
        nome: "Garoto de TI",
        id: "1",
        nota: 5,
        descricao: "formato seu Pc e passo borracha na memória",
        cidade: "Praia Grande",
        telefone: "(13) 3333 - 3333",
      ));
      servicos.add(ResumoServico(
        nome: "PC Tec",
        id: "1",
        nota: 5,
        descricao: "formato seu Pc e passo borracha na memória",
        cidade: "Praia Grande",
        telefone: "(13) 3333 - 3333",
      ));
      servicos.add(ResumoServico(
        nome: "Técnico",
        id: "1",
        nota: 5,
        descricao: "formato seu Pc e passo borracha na memória",
        cidade: "Praia Grande",
        telefone: "(13) 3333 - 3333",
      ));
      servicos.add(ResumoServico(
        nome: "Técnico",
        id: "1",
        nota: 5,
        descricao: "formato seu Pc e passo borracha na memória",
        cidade: "Praia Grande",
        telefone: "(13) 3333 - 3333",
      ));
      servicosFiltrados = servicos;
      return;
    }

    API.getResumoServicos(id).then((response) {
      setState(() {
        try {
          Iterable lista = json.decode(response.body);
          servicos =
              lista.map((model) => ResumoServico.fromJson(model)).toList();
          servicosFiltrados = servicos;
        } catch (e) {}
      });
    });
  }

  buildListaServico() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: ListView.builder(
            itemCount: servicosFiltrados.length,
            itemBuilder: (context, index) {
              return buildCardResumoServico(servicosFiltrados[index]);
            }),
      ),
    );
  }

  buildCardResumoServico(ResumoServico servico) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetalhesServico()));
        },
        splashColor: Colors.deepOrange,
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.person_outline,
                    color: Color(0xFFf5851f),
                    size: 50,
                  ),
                  Text(
                    servico.nome,
                    style: TextStyle(
                      color: Color(0xFFf5851f),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(servico.descricao),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(
                      servico.nota.toString(),
                    ),
                    Icon(
                      Icons.gps_fixed,
                    ),
                    Text(
                      servico.cidade,
                    ),
                    Icon(
                      Icons.local_phone,
                    ),
                    Text(
                      servico.telefone ?? "",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
