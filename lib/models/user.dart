import 'package:mobx_palazzo/models/models.dart';

enum UserType { ADMIN, MORADOR, PROPRIETARIO, FUNCIONARIO, SUPER, ADMUNIDADE }

class User {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? senha;
  UserType type;
  String? createdAt;
  List<Matricula>? matriculas;

  User(
      {this.id,
      required this.name,
      required this.email,
      required this.phone,
      this.senha,
      required this.type,
      this.matriculas,
      this.createdAt});

  factory User.fromJson(String key, Map json, {dynamic obj}) {
    if (!json.keys.toSet().containsAll(['name', 'username', 'phone'])) {
      throw Exception();
    }
    List<Matricula> listMat = [];

    if (json['matriculas'] != null && obj != null) {
      final List objList = obj.get('matriculas');
      objList.forEach((element) {
        try {
          listMat.add(Matricula.fromJson(element.objectId, element.toJson(),
              e: element));
        } catch (e) {}
      });
    }

    return User(
      id: key,
      name: json['name'],
      email: json['username'],
      type: UserType.values[json['type']],
      phone: json['phone'],
      matriculas: listMat,
    );
    // type: UserType.values[json['type']],
    // createdAt: json['createdAt']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'type': type?.index,
        'createdAt': createdAt
      };
}
