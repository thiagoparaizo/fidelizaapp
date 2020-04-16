class PromocaoModel {
  String id;
  String descricao;
  String detalhes;
  String estabelecimento;
  String estabelecimentoId;
  String endereco;
  String cidade;
  String estado;
  String cep;
  String localizacao;
  String fone;
  String eMail;
  String site;
  String dataCriacao;
  String status;
  bool ativa;
  bool acumulativa;
  bool repetivel;
  String dataInicio;
  String dataFim;
  String categoria;
  bool notificacoes;
  int qtdSelos;
  String categoriaId;
  String dataUpdate;

  PromocaoModel(
      {this.id,
      this.descricao,
      this.detalhes,
      this.estabelecimento,
      this.estabelecimentoId,
      this.endereco,
      this.cidade,
      this.estado,
      this.cep,
      this.localizacao,
      this.fone,
      this.eMail,
      this.site,
      this.dataCriacao,
      this.status,
      this.ativa,
      this.acumulativa,
      this.repetivel,
      this.dataInicio,
      this.dataFim,
      this.categoria,
      this.notificacoes,
      this.qtdSelos,
      this.categoriaId,
      this.dataUpdate});

  PromocaoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    detalhes = json['detalhes'];
    estabelecimento = json['estabelecimento'];
    estabelecimentoId = json['estabelecimento_id'];
    endereco = json['endereco'];
    cidade = json['cidade'];
    estado = json['estado'];
    cep = json['cep'];
    localizacao = json['localizacao'];
    fone = json['fone'];
    eMail = json['e-mail'];
    site = json['site'];
    dataCriacao = json['data_criacao'];
    status = json['status'];
    ativa = json['ativa'];
    acumulativa = json['acumulativa'];
    repetivel = json['repetivel'];
    dataInicio = json['data_inicio'];
    dataFim = json['data_fim'];
    categoria = json['categoria'];
    notificacoes = json['notificacoes'];
    qtdSelos = json['qtd_selos'];
    categoriaId = json['categoria_id'];
    dataUpdate = json['data_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    data['detalhes'] = this.detalhes;
    data['estabelecimento'] = this.estabelecimento;
    data['estabelecimento_id'] = this.estabelecimentoId;
    data['endereco'] = this.endereco;
    data['cidade'] = this.cidade;
    data['estado'] = this.estado;
    data['cep'] = this.cep;
    data['localizacao'] = this.localizacao;
    data['fone'] = this.fone;
    data['e-mail'] = this.eMail;
    data['site'] = this.site;
    data['data_criacao'] = this.dataCriacao;
    data['status'] = this.status;
    data['ativa'] = this.ativa;
    data['acumulativa'] = this.acumulativa;
    data['repetivel'] = this.repetivel;
    data['data_inicio'] = this.dataInicio;
    data['data_fim'] = this.dataFim;
    data['categoria'] = this.categoria;
    data['notificacoes'] = this.notificacoes;
    data['qtd_selos'] = this.qtdSelos;
    data['categoria_id'] = this.categoriaId;
    data['data_update'] = this.dataUpdate;
    return data;
  }
}
