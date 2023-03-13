enum UserType { ADMIN, MORADOR, PROPRIETARIO, FUNCIONARIO, SUPER, ADMUNIDADE }

class User {
  late final String nome;
  late final String email;
  late final String telefone;
  late final String senha;
  final UserType tipo;

  User(
      {required this.nome,
      required this.email,
      required this.telefone,
      required this.senha,
      this.tipo = UserType.MORADOR});
}
