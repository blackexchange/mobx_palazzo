class Cidade {
  int? id;
  String? nome;

  Cidade({this.id, this.nome});

  factory Cidade.fromJson(Map<String, dynamic> json) =>
      Cidade(id: json['id'], nome: json['nome']);

  @override
  String toString() {
    return 'Cidade {id:$id, nome:$nome}';
  }
}
