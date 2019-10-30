import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/widget/inicio_tela.dart';

class CadastroUsuario extends StatefulWidget {
  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          InicioTela(
            "IS",
            60,
            textoFilho: "Cadastro usuário",
            tamanhoTextoFilho: 10,
          ),
        ],
      ),
    );
  }
}
