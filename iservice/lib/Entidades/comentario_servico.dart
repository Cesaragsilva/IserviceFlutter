class ComentarioServico {
  String nome;
  String descricao;
  int nota;
  String idServico;
  String id;
  String idUsuarioCriacao;
  String idUsuarioAlteracao;

  ComentarioServico(
      {this.nome,
      this.descricao,
      this.nota,
      this.idServico,
      this.id,
      this.idUsuarioCriacao,
      this.idUsuarioAlteracao});

  ComentarioServico.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    descricao = json['descricao'];
    nota = json['nota'];
    idServico = json['idServico'];
    id = json['id'];
    idUsuarioCriacao = json['idUsuarioCriacao'];
    idUsuarioAlteracao = json['idUsuarioAlteracao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['nota'] = this.nota;
    data['idServico'] = this.idServico;
    data['id'] = this.id;
    data['idUsuarioCriacao'] = this.idUsuarioCriacao;
    data['idUsuarioAlteracao'] = this.idUsuarioAlteracao;
    return data;
  }
}
