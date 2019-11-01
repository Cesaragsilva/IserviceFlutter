import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/widget/botao_inicial.dart';
import 'package:todo/widget/campo_inicial.dart';
import 'package:todo/widget/inicio_tela.dart';

class CadastroUsuario extends StatefulWidget {
  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  final _ctrlNomeUsuario = TextEditingController();
  final _ctrlSobrenome = TextEditingController();
  final _ctrlApelido = TextEditingController();
  final _ctrlEmail = TextEditingController();
  final _ctrlSenha = TextEditingController();
  final _ctrlConfirmacaoSenha = TextEditingController();
  var marginTop = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            InicioTela(
              "IS",
              60,
              textoFilho: "Cadastro usuário",
              tamanhoTextoFilho: 10,
            ),
            CampoInicial(
              "Nome",
              Icons.perm_identity,
              _ctrlNomeUsuario,
              margin: marginTop,
            ),
            CampoInicial(
              "Sobrenome",
              Icons.perm_identity,
              _ctrlSobrenome,
              margin: marginTop,
            ),
            CampoInicial(
              "Como deseja ser chamado?",
              Icons.insert_emoticon,
              _ctrlApelido,
              margin: marginTop,
            ),
            CampoInicial(
              "Email",
              Icons.email,
              _ctrlEmail,
              margin: marginTop,
            ),
            CampoInicial(
              "Senha",
              Icons.vpn_key,
              _ctrlSenha,
              margin: marginTop,
              textoSecreto: true,
            ),
            CampoInicial(
              "Confirmar senha",
              Icons.vpn_key,
              _ctrlConfirmacaoSenha,
              margin: marginTop,
              textoSecreto: true,
            ),
            BotaoInicial(() {}, "Cadastrar", marginTop)
          ],
        ),
      ),
    );
  }
}
