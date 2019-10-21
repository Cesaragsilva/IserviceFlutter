

class SubCategoria {
  String nome;
  String idCategoria;
  bool ativa;
  String id;
  String idUsuarioCriacao;
  String idUsuarioAlteracao;

  SubCategoria(
      {this.nome,
      this.idCategoria,
      this.ativa,
      this.id,
      this.idUsuarioCriacao,
      this.idUsuarioAlteracao});

  SubCategoria.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    idCategoria = json['idCategoria'];
    ativa = json['ativa'];
    id = json['id'];
    idUsuarioCriacao = json['idUsuarioCriacao'];
    idUsuarioAlteracao = json['idUsuarioAlteracao'];
  }
}