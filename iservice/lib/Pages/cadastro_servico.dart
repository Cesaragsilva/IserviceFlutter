import 'package:flutter/material.dart';
import 'package:todo/utilidades/styles.dart';
import 'package:todo/widget/scaffold_customizado.dart';

class CadastroServico extends StatefulWidget {
  @override
  _CadastroServicoState createState() => _CadastroServicoState();
}

class _CadastroServicoState extends State<CadastroServico> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldCustomizado(buildCorpo());
  }

  buildCorpo() {
    return Column(
      children: <Widget>[
        buildInicioTelaComTexto(
            'Nos mostre do que é capaz, coloque algumas fotos do que você faz.'),
        buldGridImagens(),
        buildInicioTelaComTexto(
            'Nos mostre do que é capaz, coloque algumas fotos do que você faz.'),
      ],
    );
  }

  buldGridImagens() {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: (itemWidth / itemHeight),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          children: <Widget>[
            builBoxImagem(),
            builBoxImagem(),
            builBoxImagem(),
            builBoxImagem(),
            builBoxImagem(),
            builBoxImagem(),
          ],
        ),
      ),
    );
  }

  builBoxImagem() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        border: Border.all(width: 2, color: Colors.deepOrange),
      ),
    );
  }

  buildInicioTelaComTexto(String texto) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 3,
      decoration: boxDecorationLaranjaDegradeIs,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 50, top: 40, bottom: 10, right: 10),
        child: Container(
          height: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(texto,
                style: TextStyle(color: Colors.deepOrange, fontSize: 17)),
          ),
        ),
      ),
    );
  }
}
