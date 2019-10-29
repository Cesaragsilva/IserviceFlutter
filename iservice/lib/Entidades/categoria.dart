class Categoria {
  String nome;
  bool ativa;
  String id;
  String idUsuarioCriacao;
  String idUsuarioAlteracao;

  Categoria(
      {this.nome,
      this.ativa,
      this.id,
      this.idUsuarioCriacao,
      this.idUsuarioAlteracao});

  Categoria.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    ativa = json['ativa'];
    id = json['id'];
    idUsuarioCriacao = json['idUsuarioCriacao'];
    idUsuarioAlteracao = json['idUsuarioAlteracao'];
  }
}