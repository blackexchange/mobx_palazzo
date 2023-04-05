import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/user.dart';
import 'auth_store.dart';
part 'page_store.g.dart';

class PageStore = _PageStore with _$PageStore;

abstract class _PageStore with Store {
  final AuthStore authStore = GetIt.I<AuthStore>();

  _PageStore() {
    _getFirstPage();
  }

  @observable
  int page = 0;

  @observable
  User? _user;

  @action
  void setPage(int value) => page = value;

  void _getFirstPage() {
    if (authStore.isAuth) {
      _user = authStore.userAuth;

      switch (_user?.type) {
        case UserType.RESPONSAVEL:
          setPage(3);
          break;
        default:
          setPage(0);
      }
    } else {}
  }
}
