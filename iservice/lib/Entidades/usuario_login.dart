import 'dart:convert';

import 'package:todo/Entidades/usuario_token.dart';

class LoginUsuario {
  bool success;
  Data data;
  List<String> erros;

  LoginUsuario({this.success, this.data, this.erros});

  LoginUsuario.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    erros = json['errors'] != null ? (json['errors']as List).map((f) => f.toString()).toList() : null;
  }
}

class Data {
  String accessToken;
  double expiresIn;
  UserToken userToken;

  Data({this.accessToken, this.expiresIn, this.userToken});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    expiresIn = json['expiresIn'];
    userToken = json['userToken'] != null
        ? new UserToken.fromJson(json['userToken'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['expiresIn'] = this.expiresIn;
    if (this.userToken != null) {
      data['userToken'] = this.userToken.toJson();
    }
    return data;
  }
}
