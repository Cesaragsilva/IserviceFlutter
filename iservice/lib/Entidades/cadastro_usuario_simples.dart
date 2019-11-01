class CadastroUsuarioSimples {
  String id;
  String email;
  String senha;
  String confirmaSenha;
  String nomeUsuario;
  String sobrenome;
  String apelido;

  CadastroUsuarioSimples(
      {this.id,
      this.email,
      this.senha,
      this.confirmaSenha,
      this.nomeUsuario,
      this.sobrenome,
      this.apelido});

  CadastroUsuarioSimples.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    senha = json['senha'];
    confirmaSenha = json['confirmaSenha'];
    nomeUsuario = json['nomeUsuario'];
    sobrenome = json['sobrenome'];
    apelido = json['apelido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['confirmaSenha'] = this.confirmaSenha;
    data['nomeUsuario'] = this.nomeUsuario;
    data['sobrenome'] = this.sobrenome;
    data['apelido'] = this.apelido;
    return data;
  }
}
