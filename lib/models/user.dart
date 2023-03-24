enum UserType { ADMIN, MORADOR, PROPRIETARIO, FUNCIONARIO, SUPER, ADMUNIDADE }

class User {
  final String? id;
  late final String name;
  late final String email;
  late final String phone;
  final String? senha;
  final UserType? type;
  final String? createdAt;

  User(
      {this.id,
      required this.name,
      required this.email,
      required this.phone,
      this.senha,
      this.type = UserType.MORADOR,
      this.createdAt});

  factory User.fromJson(String key, Map json) {
    /* if (!json.keys.toSet().containsAll(['profile'])) {
      throw Exception();
    }*/

    return User(
        id: key,
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        type: UserType.values[json['type']],
        createdAt: json['createdAt']);
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
