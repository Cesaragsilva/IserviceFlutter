import 'package:flutter/material.dart';

import 'cardViewCategoria.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[inicioTela(context), corpoTela()],
          ),
        ),
      ),
    );
  }

  Container corpoTela() {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    var buildCampoEmail = Container(
        width: 300,
        height: 50,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 8),
            ]),
        child: Theme(
          child: TextField(
            obscureText: false,
            style: style,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Email",
                icon: Icon(Icons.email),
                border: InputBorder.none
                // OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),
                ),
          ),
          data: Theme.of(context).copyWith(primaryColor: Color(0xFFf5851f)),
        ));

    var buildCampoSenha = Container(
        width: 300,
        height: 50,
        margin: EdgeInsets.only(top: 32),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 8),
            ]),
        child: Theme(
            child: TextField(
              obscureText: true,
              style: style,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 15.0),
                  hintText: "Senha",
                  icon: Icon(Icons.vpn_key),
                  border: InputBorder
                      .none //OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                  ),
            ),
            data: Theme.of(context).copyWith(primaryColor: Color(0xFFf5851f))));

    var buttonLogin = Container(
        margin: EdgeInsets.only(top: 50, bottom: 50),
        child: ButtonTheme(
          minWidth: 300,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          child: RaisedButton(
            color: Colors.white,
            child: Text("Login",
                textAlign: TextAlign.center,
                style: style.copyWith(color: Color(0xFFf45d27))),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CardCategoria()));
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: BorderSide(color: Colors.deepOrange)),
          ),
        ));

    return Container(
      padding: EdgeInsets.only(top: 40),
      child: Column(
        children: <Widget>[
          buildCampoEmail,
          buildCampoSenha,
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 32),
              child: Text(
                'Esqueceu sua senha?',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          buttonLogin
        ],
      ),
    );
  }

  Container inicioTela(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Align(
            alignment: Alignment.center,
            child:
                Text("IS", style: TextStyle(fontSize: 60, color: Colors.white)),
          ),
          Spacer(),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 32, bottom: 32),
                child: Text("Login",
                    style: TextStyle(color: Colors.white, fontSize: 19)),
              )),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
          
              colors: [Color(0xFFf45d27), Color(0xFFf5851f)]),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90))),
    );
  }
}
