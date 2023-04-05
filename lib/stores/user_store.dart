import 'package:mobx/mobx.dart';
import '../../models/models.dart';
import '../helpers/helpers.dart';
import '../repositories/repositories.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  _UserStore() {
    autorun((_) async {
      try {
        setLoading(true);

        final users = await UserRepo().getUsers();
        userList.clear();
        userList.addAll(users!);
        setError(null);
        setLoading(false);
      } catch (e) {
        setError(e.toString());
      }
    });
  }

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @action
  void setError(String? value) => error = value;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  String search = '';

  @action
  void setSearch(String value) => search = value;

  ObservableList<User> userList = ObservableList<User>();

  @action
  Future<void> atualizaMatriculaUsuario(User u) async {
    isLoading = true;

    UserRepo m = UserRepo();
    try {
      await m.atualizarMatriculas(u);
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
  }
}
