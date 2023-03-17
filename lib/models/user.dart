enum UserType { ADMIN, MORADOR, PROPRIETARIO, FUNCIONARIO, SUPER, ADMUNIDADE }

class User {
  final String? id;
  late final String nome;
  late final String email;
  late final String telefone;
  final String? senha;
  final UserType? tipo;
  final String? createdAt;

  User(
      {this.id,
      required this.nome,
      required this.email,
      required this.telefone,
      this.senha,
      this.tipo = UserType.MORADOR,
      this.createdAt});

  factory User.fromJson(String key, Map json) {
    /* if (!json.keys.toSet().containsAll(['profile'])) {
      throw Exception();
    }*/

    return User(
        id: key,
        nome: json['nome'],
        email: json['email'],
        telefone: json['telefone'],
        tipo: UserType.values[json['tipo']],
        createdAt: json['createdAt']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'email': email,
        'telefone': telefone,
        'tipo': tipo?.index,
        'createdAt': createdAt
      };
}
