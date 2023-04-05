import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../models/models.dart';
import '../stores/stores.dart';
import '../helpers/helpers.dart';
import '../repositories/repositories.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final AuthStore auth = GetIt.I<AuthStore>();
  _HomeStore() {
    autorun((_) async {
      if (auth.isAuth) {
        setLoading(true);
        try {
          final matriculas = await MatriculaRepo().getMatriculas(search);
          print(matriculas);
          matriculaList.clear();
          matriculaList.addAll(matriculas!);
          setError(null);
          setLoading(false);
        } catch (e) {
          setError(e.toString());
        }
      }
    });
  }

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

  ObservableList<Matricula> matriculaList = ObservableList<Matricula>();
}
