import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../helpers/helpers.dart';
import '../repositories/repositories.dart';
import './auth_store.dart';

part 'signin_store.g.dart';

class SignInStore = _SignInStore with _$SignInStore;

abstract class _SignInStore with Store {
  @observable
  String? error;

  @observable
  String? email;

  @action
  setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email!.isValidEmail();

  String? get emailError =>
      (email == null || emailValid) ? null : 'E-mail inválido';

  @observable
  String? senha;

  @action
  setSenha(String value) => senha = value;

  @computed
  bool get senhaValid => senha != null && senha!.length >= 4;

  String? get senhaError =>
      (senha == null || senhaValid) ? null : 'Senha inválida';

  void Function()? get signInPressed =>
      emailValid && senhaValid ? _signIn : null;

  @observable
  bool isLoading = false;

  @action
  Future<void> _signIn() async {
    isLoading = true;
    error = null;
    try {
      final userRet = await UserRepo().signIn(email!, senha!);
      GetIt.I<AuthStore>().setUser(userRet);
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
  }
}
