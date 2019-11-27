import 'package:flutter/material.dart';
import 'package:todo/utilidades/styles.dart';
import 'package:todo/widget/area_texto.dart';
import 'package:todo/widget/scaffold_customizado.dart';

class DetalhesServico extends StatefulWidget {
  @override
  _DetalhesServicoState createState() => _DetalhesServicoState();
}

class _DetalhesServicoState extends State<DetalhesServico> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldCustomizado(buildCorpo());
  }

  buildCorpo() {
    return Column(
      children: <Widget>[
        buildInicioTelaComTexto(
            'Nos mostre do que é capaz, coloque algumas fotos do que você faz.'),
        Expanded(
          child: ListView(
            children: <Widget>[
              buildDescricaoServico(),
              buildImagens(),
              buildImagens(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: buildImagens(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  buildImagens() {
    return Row(
      children: <Widget>[
        builBoxImagem(),
        builBoxImagem(),
      ],
    );
  }

  builBoxImagem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width / 2.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3,
              offset: Offset.fromDirection(1),
            ),
          ],
          color: Colors.white,
        ),
      ),
    );
  }

  buildInicioTelaComTexto(String texto) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 4.5,
      decoration: boxDecorationLaranjaDegrade,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            "Cadastro de serviço",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  buildDescricaoServico() {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            'Descrição do serviço',
            style: TextStyle(
              color: Colors.grey, //Color(0xFFf5851f),
              fontSize: 15,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0).copyWith(top: 15),
          child: AreaTexto("", null, null),
        ),
      ],
    );
  }

  buildListaCometario() {
    return Container(
        // child: ListView.builder(),
        );
  }
}
