import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/entidades/usuario.dart';
import 'package:todo/pages/login.dart';
import 'package:todo/widget/botao_inicial.dart';
import 'package:todo/widget/texto_final_tela_link.dart';

import 'cardViewCategoria.dart';

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(statusBarColor: Theme.of(context).primaryColor));

    return Scaffold(
      body: gerarcorpo(context),
    );
  }
}

gerarcorpo(BuildContext context) {
  return Column(
    children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height / 1.3,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.orange,
        ),
      ),
      BotaoInicial(
        () {
          setStatusBarransparente();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
        },
        "Acessar Meu IService",
        10,
        largura: 250,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TextoFinalTelaLink(() {
          setStatusBarransparente();
          Usuario.usuario = "teste";
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CardCategoria()));
        }, 'Acessar IService ', 'sem login!'),
      )
    ],
  );
}

setStatusBarransparente() {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  //   // statusBarBrightness: Brightness.light,
  //   systemNavigationBarIconBrightness: Brightness.light,
  // ));
}
