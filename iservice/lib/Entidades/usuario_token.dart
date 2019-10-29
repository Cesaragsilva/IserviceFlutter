import 'package:todo/Entidades/usuario_clams.dart';

class UserToken {
  String id;
  String email;
  List<Claims> claims;

  UserToken({this.id, this.email, this.claims});

  UserToken.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    if (json['claims'] != null) {
      claims = new List<Claims>();
      json['claims'].forEach((v) {
        claims.add(new Claims.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    if (this.claims != null) {
      data['claims'] = this.claims.map((v) => v.toJson()).toList();
    }
    return data;
  }
}