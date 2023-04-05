import 'package:escolaflow/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import '../helpers/helpers.dart';
import '../repositories/repositories.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  User? userAuth;

  _AuthStore() {
    _getCurrentUser();
  }

  ObservableList<Matricula?> myMatriculaList = ObservableList<Matricula>();

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @action
  setUser(User? value) => userAuth = value;

  @computed
  bool get isAuth => userAuth != null;

  Future<void> _getCurrentUser() async {
    final user = await UserRepo().currentUser();
    if (user != null) {
      setUser(user);
    }
  }

  Future<void> logout() async {
    await UserRepo().logout();

    setUser(null);
  }

  @action
  Future<void> atualizaMatriculaUsuario() async {
    isLoading = true;

    UserRepo m = UserRepo();
    try {
      await m.atualizarMatriculas(userAuth!);
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
  }
}
