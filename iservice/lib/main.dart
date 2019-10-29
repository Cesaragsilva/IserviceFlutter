import 'dart:convert' show json;

import 'package:flutter/material.dart';
import 'package:todo/services/api.dart';
import 'Entidades/categoria.dart';
import 'Pages/login.dart';
import 'Pages/splash.dart';
import 'listaSubCategorias.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFFf45d27)),
      home: new SplashPage(),
      routes: <String, WidgetBuilder>{
        '/Login': (BuildContext context) => new Login()
      },
    );
  }
}

class BuildListViewApi extends StatefulWidget {
  @override
  _BuildListViewApiState createState() => _BuildListViewApiState();
}

class _BuildListViewApiState extends State<BuildListViewApi> {
  var categorias = new List<Categoria>();

  _getCategorias() {
    API.getCategoria().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        categorias = lista.map((model) => Categoria.fromJson(model)).toList();
      });
    });
  }

  _BuildListViewApiState() {
    _getCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Categorias"),
          backgroundColor: Colors.deepOrange,
        ),
        body: listaCategoria());
  }

  listaCategoria() {
    return ListView.builder(
      itemCount: categorias.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            categorias[index].nome,
            style: TextStyle(fontSize: 20.0, color: Colors.deepOrange),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ListaSubCategoria(categorias[index])));
          },
        );
      },
    );
  }
}
