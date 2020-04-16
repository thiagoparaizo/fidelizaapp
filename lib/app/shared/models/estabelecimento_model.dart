class EstabelecimentoModel {
  String id;
  String nomeFantasia;
  String nomeReal;
  String responsavel;
  String endereco;
  String cidade;
  String estado;
  String cep;
  String localizacao;
  List<String> fone;
  String eMail;
  String site;
  String dataCadastro;
  List<Filial> filial;
  List<Promocoes> promocoes;
  String status;
  bool ativa;
  String tipoContrato;
  bool free;
  String dataInicio;
  String dataFim;
  bool notificacoes;
  int qtdSelos;
  String categoriaId;
  String dataUpdate;

  EstabelecimentoModel(
      {this.id,
      this.nomeFantasia,
      this.nomeReal,
      this.responsavel,
      this.endereco,
      this.cidade,
      this.estado,
      this.cep,
      this.localizacao,
      this.fone,
      this.eMail,
      this.site,
      this.dataCadastro,
      this.filial,
      this.promocoes,
      this.status,
      this.ativa,
      this.tipoContrato,
      this.free,
      this.dataInicio,
      this.dataFim,
      this.notificacoes,
      this.qtdSelos,
      this.categoriaId,
      this.dataUpdate});

  EstabelecimentoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomeFantasia = json['nome_fantasia'];
    nomeReal = json['nome_real'];
    responsavel = json['responsavel'];
    endereco = json['endereco'];
    cidade = json['cidade'];
    estado = json['estado'];
    cep = json['cep'];
    localizacao = json['localizacao'];
    fone = json['fone'].cast<String>();
    eMail = json['e-mail'];
    site = json['site'];
    dataCadastro = json['data_cadastro'];
    if (json['filial'] != null) {
      filial = new List<Filial>();
      json['filial'].forEach((v) {
        filial.add(new Filial.fromJson(v));
      });
    }
    if (json['promocoes'] != null) {
      promocoes = new List<Promocoes>();
      json['promocoes'].forEach((v) {
        promocoes.add(new Promocoes.fromJson(v));
      });
    }
    status = json['status'];
    ativa = json['ativa'];
    tipoContrato = json['tipo_contrato'];
    free = json['free'];
    dataInicio = json['data_inicio'];
    dataFim = json['data_fim'];
    notificacoes = json['notificacoes'];
    qtdSelos = json['qtd_selos'];
    categoriaId = json['categoria_id'];
    dataUpdate = json['data_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome_fantasia'] = this.nomeFantasia;
    data['nome_real'] = this.nomeReal;
    data['responsavel'] = this.responsavel;
    data['endereco'] = this.endereco;
    data['cidade'] = this.cidade;
    data['estado'] = this.estado;
    data['cep'] = this.cep;
    data['localizacao'] = this.localizacao;
    data['fone'] = this.fone;
    data['e-mail'] = this.eMail;
    data['site'] = this.site;
    data['data_cadastro'] = this.dataCadastro;
    if (this.filial != null) {
      data['filial'] = this.filial.map((v) => v.toJson()).toList();
    }
    if (this.promocoes != null) {
      data['promocoes'] = this.promocoes.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['ativa'] = this.ativa;
    data['tipo_contrato'] = this.tipoContrato;
    data['free'] = this.free;
    data['data_inicio'] = this.dataInicio;
    data['data_fim'] = this.dataFim;
    data['notificacoes'] = this.notificacoes;
    data['qtd_selos'] = this.qtdSelos;
    data['categoria_id'] = this.categoriaId;
    data['data_update'] = this.dataUpdate;
    return data;
  }
}

class Filial {
  String id;
  String nome;
  String responsavel;
  List<String> telefones;
  String eMail;
  String endereco;
  String cidade;
  String estado;
  String cep;
  String localizacao;
  String status;
  bool ativa;
  List<Funcionarios> funcionarios;

  Filial(
      {this.id,
      this.nome,
      this.responsavel,
      this.telefones,
      this.eMail,
      this.endereco,
      this.cidade,
      this.estado,
      this.cep,
      this.localizacao,
      this.status,
      this.ativa,
      this.funcionarios});

  Filial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    responsavel = json['responsavel'];
    telefones = json['telefones'].cast<String>();
    eMail = json['e-mail'];
    endereco = json['endereco'];
    cidade = json['cidade'];
    estado = json['estado'];
    cep = json['cep'];
    localizacao = json['localizacao'];
    status = json['status'];
    ativa = json['ativa'];
    if (json['funcionarios'] != null) {
      funcionarios = new List<Funcionarios>();
      json['funcionarios'].forEach((v) {
        funcionarios.add(new Funcionarios.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['responsavel'] = this.responsavel;
    data['telefones'] = this.telefones;
    data['e-mail'] = this.eMail;
    data['endereco'] = this.endereco;
    data['cidade'] = this.cidade;
    data['estado'] = this.estado;
    data['cep'] = this.cep;
    data['localizacao'] = this.localizacao;
    data['status'] = this.status;
    data['ativa'] = this.ativa;
    if (this.funcionarios != null) {
      data['funcionarios'] = this.funcionarios.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Funcionarios {
  String id;
  String nome;
  String eMail;
  bool ativo;

  Funcionarios({this.id, this.nome, this.eMail, this.ativo});

  Funcionarios.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    eMail = json['e-mail'];
    ativo = json['ativo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['e-mail'] = this.eMail;
    data['ativo'] = this.ativo;
    return data;
  }
}

class Promocoes {
  String idPromocao;
  List<Selos> selos;

  Promocoes({this.idPromocao, this.selos});

  Promocoes.fromJson(Map<String, dynamic> json) {
    idPromocao = json['id_promocao'];
    if (json['selos'] != null) {
      selos = new List<Selos>();
      json['selos'].forEach((v) {
        selos.add(new Selos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_promocao'] = this.idPromocao;
    if (this.selos != null) {
      data['selos'] = this.selos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Selos {
  String id;

  Selos({this.id});

  Selos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
