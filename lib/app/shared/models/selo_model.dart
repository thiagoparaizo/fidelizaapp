class SeloModel {
  String id;
  String promocaoId;
  String filial;
  String responsavel;
  String clienteId;
  String data;
  bool confirmado;
  String observacao;

  SeloModel(
      {this.id,
      this.promocaoId,
      this.filial,
      this.responsavel,
      this.clienteId,
      this.data,
      this.confirmado = true,
      this.observacao});

  SeloModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    promocaoId = json['promocao_id'];
    filial = json['filial'];
    responsavel = json['responsavel'];
    clienteId = json['cliente-id'];
    data = json['data'];
    confirmado = json['confirmado'];
    observacao = json['observacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['promocao_id'] = this.promocaoId;
    data['filial'] = this.filial;
    data['responsavel'] = this.responsavel;
    data['cliente-id'] = this.clienteId;
    data['data'] = this.data;
    data['confirmado'] = this.confirmado;
    data['observacao'] = this.observacao;
    return data;
  }
}
