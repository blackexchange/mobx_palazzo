import './models.dart';

enum Status { PENDENTE, ATIVO, INATIVO }

class Matricula {
  String? id;
  String? nome;
  String? descricao;
  String? phone;
  Address? address;
  bool especial = false;
  Status status = Status.PENDENTE;
  Turma? turma;
  User? user;
  String? email;
  String? createdAt;
  int? buscas;

  Matricula(
      {this.id,
      required this.especial,
      required this.nome,
      this.descricao,
      required this.turma,
      this.createdAt,
      this.phone,
      this.email,
      required this.address,
      required this.user,
      required status,
      this.buscas});

  factory Matricula.fromJson(String key, Map json) {
    /* if (!json.keys.toSet().containsAll(['profile'])) {
      throw Exception();
    }*/

    return Matricula(
        id: key,
        nome: json['nome'],
        especial: json['especial'],
        descricao: json['descricao'],
        phone: json['phone'],
        email: json['email'],
        address: Address(
            uf: UF(sigla: json['uf']),
            cidade: Cidade(nome: json['cidade']),
            bairro: json['bairro'],
            cep: json['cep']),
        createdAt: json['createdAt'],
        turma: Turma.fromJson('objectId', json['turma']),
        user: User.fromJson('ObjectId', json['owner']),
        status: Status.values[json['status']]);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'descricao': descricao,
        'turma': turma,
        'phone': phone,
        'email': email,
        'status': status.index,
        'createdAt': createdAt
      };
}
