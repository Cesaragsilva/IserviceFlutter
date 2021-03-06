import 'package:flutter/material.dart';
import 'package:todo/utilidades/styles.dart';
import 'package:todo/widget/area_texto.dart';
import 'package:todo/widget/menu.dart';
import 'package:todo/widget/scaffold_customizado.dart';

class CadastroServico extends StatefulWidget {
  @override
  _CadastroServicoState createState() => _CadastroServicoState();
}

class _CadastroServicoState extends State<CadastroServico> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldCustomizado(buildCorpo());
    // Scaffold(
    //   drawer: Menu(),
    //   body: Stack(
    //     children: <Widget>[
    //       buildCorpo(),
    //       Positioned(
    //         top: 0.0,
    //         left: 0.0,
    //         right: 0.0,
    //         child: AppBar(
    //           backgroundColor: Colors.transparent,
    //           elevation: 0.0,
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    // ScaffoldCustomizado(buildCorpo());
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
              buildInicioTela(),
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
          // border: Border.all(
          //   width: 2,
          //   color: Color(0xFFf5851f),
          // ),
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
      // child: Padding(
      //   padding: const EdgeInsets.only(
      //     left: 50,
      //     top: 40,
      //     bottom: 10,
      //     right: 10,
      //   ),
      //   // child: Container(
      //   //   height: 10,
      //   //   decoration: BoxDecoration(
      //   //       borderRadius: BorderRadius.only(
      //   //           topRight: Radius.circular(30),
      //   //           bottomLeft: Radius.circular(30),
      //   //           bottomRight: Radius.circular(30)),
      //   //       color: Colors.white),
      //   // child:
      //   // Padding(
      //   //   padding: const EdgeInsets.all(8.0),
      //   //   child: Text(texto,
      //   //       style: TextStyle(
      //   //         color: Colors.grey,
      //   //         fontSize: 17,
      //   //       )),
      //   // ),
      //   // ),
      // ),
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

  buildInicioTela() {
    return Container(
      height: MediaQuery.of(context).size.width / 8,
      width: MediaQuery.of(context).size.width,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "Nos mostre o que você faz.",
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
