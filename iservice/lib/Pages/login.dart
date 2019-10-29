import 'package:flutter/material.dart';
import 'package:todo/Pages/recuperar_senha.dart';
import 'package:todo/Widget/botao_inicial.dart';
import 'package:todo/Widget/campo_inicial.dart';
import 'package:todo/Widget/inicio_tela.dart';
import 'package:todo/services/api.dart';

import 'cardViewCategoria.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _ctrlLogin = TextEditingController();
  final _ctrlSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              InicioTela("IS", 60, textoFilho: "Login"),
              corpoTela(context)
            ],
          ),
        ),
      ),
    );
  }

  Container corpoTela(BuildContext context) {
    var buttonLogin = BotaoInicial(() {
      _clickButton(context);
    }, "Entrar", 50);

    return Container(
      padding: EdgeInsets.only(top: 40),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            CampoInicial('Email', Icons.email, _ctrlLogin),
            CampoInicial('Senha', Icons.vpn_key, _ctrlSenha,
                margin: 32, textoSecreto: true),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 32),
                child: InkWell(
                  child: Text(
                    'Esqueceu sua senha?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecuperarSenha()));
                  },
                ),
              ),
            ),
            buttonLogin
          ],
        ),
      ),
    );
  }

  void _clickButton(BuildContext context) async {
    bool formOk = _formKey.currentState.validate();

    if (!formOk) return;

    String login = _ctrlLogin.text;
    String senha = _ctrlSenha.text;

    print("login: $login senh: $senha");

    var usuario = await API.postLogin(login, senha);

    if (usuario != null && usuario.erros == null)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CardCategoria()));

    print("Chegou!!!");
    AlertDialog(title: Text("login"), content: Text("Login invalido"));
  }
}
