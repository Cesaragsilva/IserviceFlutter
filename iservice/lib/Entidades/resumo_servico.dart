class ResumoServico {
  String idSubCategoriaServico;
  String nome;
  String descricao;
  bool ativo;
  double nota;
  String nomeUSuario;
  String cidade;
  String telefone;
  String email;
  String id;
  String idUsuarioCriacao;
  String idUsuarioAlteracao;

  ResumoServico(
      {this.idSubCategoriaServico,
      this.nome,
      this.descricao,
      this.ativo,
      this.nota,
      this.nomeUSuario,
      this.cidade,
      this.telefone,
      this.email,
      this.id,
      this.idUsuarioCriacao,
      this.idUsuarioAlteracao});

  ResumoServico.fromJson(Map<String, dynamic> json) {
    idSubCategoriaServico = json['idSubCategoriaServico'];
    nome = json['nome'];
    descricao = json['descricao'];
    ativo = json['ativo'];
    nota = json['nota'];
    nomeUSuario = json['nomeUSuario'];
    cidade = json['cidade'];
    telefone = json['telefone'];
    email = json['email'];
    id = json['id'];
    idUsuarioCriacao = json['idUsuarioCriacao'];
    idUsuarioAlteracao = json['idUsuarioAlteracao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idSubCategoriaServico'] = this.idSubCategoriaServico;
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['ativo'] = this.ativo;
    data['nota'] = this.nota;
    data['nomeUSuario'] = this.nomeUSuario;
    data['cidade'] = this.cidade;
    data['telefone'] = this.telefone;
    data['email'] = this.email;
    data['id'] = this.id;
    data['idUsuarioCriacao'] = this.idUsuarioCriacao;
    data['idUsuarioAlteracao'] = this.idUsuarioAlteracao;
    return data;
  }
}
