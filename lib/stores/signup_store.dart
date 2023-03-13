import 'package:mobx/mobx.dart';
import 'package:mobx_palazzo/models/user.dart';
import '../helpers/helpers.dart';
import '../repositories/repositories.dart';

part 'signup_store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {
  @observable
  String? name;
  String? error;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name!.length > 4;
  String? get nameError {
    if (name == null || nameValid) {
      return null;
    } else if (name!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  @observable
  String? email;

  @action
  setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email!.isValidEmail();

  String? get emailError {
    if (email == null || emailValid) {
      return null;
    } else if (email!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'E-mail inválido';
    }
  }

  @observable
  String? senha;

  @action
  setSenha(String value) => senha = value;

  @computed
  bool get senhaValid => senha != null && senha!.length >= 6;

  String? get senhaError {
    if (senha == null || senhaValid) {
      return null;
    } else if (senha!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Senha inválida';
    }
  }

  @observable
  String? confirmaSenha;

  @action
  setConfirmaSenha(String value) => confirmaSenha = value;

  @computed
  bool get confirmaSenhaValid =>
      confirmaSenha != null && confirmaSenha == senha;

  String? get confirmaSenhaError {
    if (confirmaSenha == null || confirmaSenhaValid) {
      return null;
    } else if (confirmaSenha!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Senhas diferentes';
    }
  }

  @observable
  String? telefone;

  @action
  setTelefone(String value) => telefone = value;

  @computed
  bool get telefoneValid => telefone != null && telefone!.length > 6;

  String? get telefoneError {
    if (telefone == null || telefoneValid) {
      return null;
    } else if (telefone!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Campo inválido';
    }
  }

  bool get isFormValid =>
      nameValid &&
      telefoneValid &&
      senhaValid &&
      confirmaSenhaValid &&
      emailValid;

  void Function()? get signUpPressed =>
      (isFormValid && !isLoading) ? _signUp : null;

  @observable
  bool isLoading = false;

  @action
  Future<void> _signUp() async {
    isLoading = true;

    final user =
        User(nome: name!, email: email!, telefone: telefone!, senha: senha!);

    try {
      UserRepo().signUp(user);
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
  }
}
