enum UserType { ADMIN, MORADOR, PROPRIETARIO, FUNCIONARIO, SUPER, ADMUNIDADE }

class User {
  late final String id;
  late final String nome;
  late final String email;
  late final String telefone;
  final String? senha;
  final UserType tipo;

  User(
      {required this.id,
      required this.nome,
      required this.email,
      required this.telefone,
      this.senha,
      this.tipo = UserType.MORADOR});

  factory User.fromJson(String key, Map json) {
    /* if (!json.keys.toSet().containsAll(['profile'])) {
      throw Exception();
    }*/

    return User(
        id: key,
        nome: json['nome'],
        email: json['email'],
        telefone: json['telefone'],
        tipo: json['tipo']);
  }

  Map toJson() => {
        'id': id,
        'nome': nome,
        'email': email,
        'telefone': telefone,
        'tipo': tipo
      };
}
