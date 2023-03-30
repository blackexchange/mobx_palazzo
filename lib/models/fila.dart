import './models.dart';

enum FilaStatus { NAROTA, NAFILA, SAIUDAFILA }

class Fila {
  String? id;
  Matricula? matricula;

  FilaStatus? status;

  DateTime? createdAt;
  String? successAt;
  User? responsavel;
  int? posicaoNaFila;

  Fila(
      {this.id,
      required this.matricula,
      this.createdAt,
      this.status,
      this.posicaoNaFila,
      required this.responsavel,
      this.successAt});

  factory Fila.fromJson(String key, Map json, {dynamic e}) {
    /* if (!json.keys.toSet().containsAll(['profile'])) {
      throw Exception();
    }*/

    return Fila(
      id: key,
      matricula: Matricula.fromJson(
          json['matricula']['objectId'], e.get('matricula').toJson(),
          e: e.get('matricula')),
      status: FilaStatus.values[json['status']],
      createdAt: DateTime.parse(json['createdAt']),
      responsavel: User.fromJson(
          json['responsavel']['objectId'], e.get('responsavel').toJson(),
          obj: e.get('responsavel')),
    );
  }

  Map<String, dynamic> toJson() => {
        /*'id': id,
        'nome': nome,
        'descricao': descricao,
        'turma': turma,
        'phone': phone,
        'email': email,
        'status': status.index,
        'createdAt': createdAt,
        'responsaveis': responsaveis*/
      };
}
