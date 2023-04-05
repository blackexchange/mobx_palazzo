import './models.dart';

enum MatriculaStatus { PENDENTE, ATIVO, INATIVO }

class Matricula {
  String? id;
  String? nome;
  String? descricao;
  String? phone;
  Address? address;
  bool especial;
  MatriculaStatus status;
  Turma? turma;
  User? user;
  String? email;
  String? createdAt;
  int? buscas;
  List<User>? responsaveis;
  String? posicaoNaFila;
  FilaStatus? filaStatus;

  Matricula(
      {this.id,
      this.especial = false,
      required this.nome,
      this.descricao,
      required this.turma,
      this.createdAt,
      this.phone,
      this.email,
      required this.address,
      required this.user,
      this.status = MatriculaStatus.PENDENTE,
      this.buscas,
      this.responsaveis});

  factory Matricula.fromJson(String key, Map json, {dynamic e}) {
    if (!json.keys.toSet().containsAll(['especial'])) {
      throw Exception('Matrícula inválida');
    }

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
        turma: Turma.fromJson(
            json['turma']['objectId'], e.get('turma').toJson(),
            e: e.get('turma')),
        user: User.fromJson(json['owner']['objectId'], e.get('owner').toJson()),
        responsaveis: [],
        status: MatriculaStatus.values[json['status']]);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'descricao': descricao,
        'turma': turma,
        'phone': phone,
        'email': email,
        'status': status.index,
        'createdAt': createdAt,
        'responsaveis': responsaveis
      };
}
