class UsuarioModel {
  String id;
  String nome;
  String cpf;
  String dtNascimento;
  String eMail;
  bool ativo;
  int idade;
  String cidade;
  String estado;
  String telefone;
  String perfil;
  List<Interesses> interesses;
  List<Promocoes> promocoes;
  Configuracoes configuracoes;

  UsuarioModel(
      {this.id,
      this.nome,
      this.cpf,
      this.dtNascimento,
      this.eMail,
      this.ativo,
      this.idade,
      this.cidade,
      this.estado,
      this.telefone,
      this.perfil,
      this.interesses,
      this.promocoes,
      this.configuracoes});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cpf = json['cpf'];
    dtNascimento = json['dt_nascimento'];
    eMail = json['e-mail'];
    ativo = json['ativo'];
    idade = json['idade'];
    cidade = json['cidade'];
    estado = json['estado'];
    telefone = json['telefone'];
    perfil = json['perfil'];
    if (json['interesses'] != null) {
      interesses = new List<Interesses>();
      json['interesses'].forEach((v) {
        interesses.add(new Interesses.fromJson(v));
      });
    }
    if (json['promocoes'] != null) {
      promocoes = new List<Promocoes>();
      json['promocoes'].forEach((v) {
        promocoes.add(new Promocoes.fromJson(v));
      });
    }
    configuracoes = json['configuracoes'] != null
        ? new Configuracoes.fromJson(json['configuracoes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    data['dt_nascimento'] = this.dtNascimento;
    data['e-mail'] = this.eMail;
    data['ativo'] = this.ativo;
    data['idade'] = this.idade;
    data['cidade'] = this.cidade;
    data['estado'] = this.estado;
    data['telefone'] = this.telefone;
    data['perfil'] = this.perfil;
    if (this.interesses != null) {
      data['interesses'] = this.interesses.map((v) => v.toJson()).toList();
    }
    if (this.promocoes != null) {
      data['promocoes'] = this.promocoes.map((v) => v.toJson()).toList();
    }
    if (this.configuracoes != null) {
      data['configuracoes'] = this.configuracoes.toJson();
    }
    return data;
  }
}

class Interesses {
  String categoria;

  Interesses({this.categoria});

  Interesses.fromJson(Map<String, dynamic> json) {
    categoria = json['categoria'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoria'] = this.categoria;
    return data;
  }
}

class Promocoes {
  String idPromocao;
  bool favorito;
  List<Selos> selos;

  Promocoes({this.idPromocao, this.favorito, this.selos});

  Promocoes.fromJson(Map<String, dynamic> json) {
    idPromocao = json['id_promocao'];
    favorito = json['favorito'];
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
    data['favorito'] = this.favorito;
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

class Configuracoes {
  bool notificacoes;
  bool publicidade;
  String dataAcesso;
  String dataCadastro;
  String dispositivoId;
  String dispositivoModelo;
  int quantidadeAcesso;
  String versaoApp;
  List<String> compartilhamento;

  Configuracoes(
      {this.notificacoes,
      this.publicidade,
      this.dataAcesso,
      this.dataCadastro,
      this.dispositivoId,
      this.dispositivoModelo,
      this.quantidadeAcesso,
      this.versaoApp,
      this.compartilhamento});

  Configuracoes.fromJson(Map<String, dynamic> json) {
    notificacoes = json['notificacoes'];
    publicidade = json['publicidade'];
    dataAcesso = json['data_acesso'];
    dataCadastro = json['data_cadastro'];
    dispositivoId = json['dispositivo_id'];
    dispositivoModelo = json['dispositivo_modelo'];
    quantidadeAcesso = json['quantidade_acesso'];
    versaoApp = json['versao_app'];
    compartilhamento = json['compartilhamento'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notificacoes'] = this.notificacoes;
    data['publicidade'] = this.publicidade;
    data['data_acesso'] = this.dataAcesso;
    data['data_cadastro'] = this.dataCadastro;
    data['dispositivo_id'] = this.dispositivoId;
    data['dispositivo_modelo'] = this.dispositivoModelo;
    data['quantidade_acesso'] = this.quantidadeAcesso;
    data['versao_app'] = this.versaoApp;
    data['compartilhamento'] = this.compartilhamento;
    return data;
  }
}
