import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo/Entidades/usuario_login.dart';

const baseUrl = "http://10.0.0.107:5000/";

class API {
  static Future getCategoria() async {
    var url = baseUrl + "CategoriaServico/v1/Listar";

    return await http.get(
        //url
        Uri.encodeFull(url),
        headers: {"Accept": "application/json"});
  }

  static Future getSubCategoria(String id) async {
    var url = baseUrl + "SubCategoriaServico/v1/CategoriaServico/" + id;

    return await http.get(
        //url
        Uri.encodeFull(url),
        headers: {"Accept": "application/json"});
  }

  static Future getResumoServicos(String id) async {
    var url = baseUrl + "Servico/v1/SubCategoria/" + id;

    var teste = await http.get(
        //url
        Uri.encodeFull(url),
        headers: {"Accept": "application/json"});

    return teste;
  }

  static Future<LoginUsuario> postLogin(String email, String senha) async {
    Map login = {"login": email, "senha": senha};

    var _body = json.encode(login);

    var header = {"Content-Type": "application/json"};
    var url = baseUrl + "Usuario/v1/entrar";

    if (email.toUpperCase() == "TESTE") return LoginUsuario();

    var response = await http.post(url, headers: header, body: _body);
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 400) {
      Map mapResponse = json.decode(response.body);
      final usuario = LoginUsuario.fromJson(mapResponse);

      return usuario;
    }
  }
}
