import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../models/models.dart';
import '../../stores/stores.dart';
import '../helpers/helpers.dart';
import '../repositories/repositories.dart';

part 'account_store.g.dart';

class AccountStore = _AccountStore with _$AccountStore;

abstract class _AccountStore with Store {
  final AuthStore authStore = GetIt.I<AuthStore>();

  _AccountStore() {
    _user = authStore.userAuth;

    name = _user?.name;
    phone = _user?.phone;
    userType = _user?.type;

    // autorun((_) async {});
  }

  User? _user;

  @observable
  UserType? userType;

  @action
  void setUserType(int? value) => userType = UserType.values[value!];

  @observable
  String? name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null;

  @observable
  String? phone;

  @action
  void setPhone(String value) => phone = value;

  @observable
  String pass1 = '';

  @action
  void setPass1(String value) => pass1 = value;

  @observable
  String pass2 = '';

  @action
  void setPass2(String value) => pass2 = value;

  @observable
  bool formValid = false;

  @observable
  bool loading = false;

  @computed
  VoidCallback? get send => (!formValid && !loading) ? _send : null;

  @action
  Future<void> _send() async {
    loading = true;

    _user?.name = name!;
    _user?.phone = phone!;
    _user?.type = userType!;

    if (pass1.isNotEmpty) {
      _user?.senha = pass1;
    } else {
      _user?.senha = null;
    }

    try {
      await UserRepo().save(_user!);
      authStore.setUser(_user!);
    } catch (e) {}

    loading = false;
  }

  void logout() => authStore.logout();
}
