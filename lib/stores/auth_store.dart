import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_palazzo/models/user.dart';
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

  @action
  setUser(User value) => userAuth = value;

  @computed
  bool get isAuth => userAuth != null;

  Future<void> _getCurrentUser() async {
    final user = await UserRepo().currentUser();
    if (user != null) {
      setUser(user);
    }
  }
}
