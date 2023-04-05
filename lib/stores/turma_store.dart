import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../../stores/stores.dart';
import '../helpers/helpers.dart';
import '../repositories/repositories.dart';
import '../models/models.dart';

part 'turma_store.g.dart';

class TurmaStore = _TurmaStore with _$TurmaStore;

abstract class _TurmaStore with Store {
  final AuthStore authStore = GetIt.I<AuthStore>();

  _TurmaStore() {
    _user = authStore.userAuth;

    _loadTurmas();
  }
  User? _user;

  ObservableList<Turma> turmaList = ObservableList<Turma>();

  @observable
  String? error;

  @computed
  List<Turma> get allTurma => List.from(turmaList)
    ..insert(
        0,
        Turma(
            id: "*",
            title: 'Todas',
            desc: '',
            active: true,
            escola: Escola(nome: '')));

  @action
  void setError(String value) => error = value;

  void setTurmas(List<Turma> turmas) {
    turmaList.clear();
    turmaList.addAll(turmas);
  }

  Future<void> _loadTurmas() async {
    final escolaId = _user?.escola?.id;

    try {
      final turmas = await TurmaRepo().getList(escolaId!);
      setTurmas(turmas);
    } catch (e) {
      setError(e.toString());
    }
  }
}
