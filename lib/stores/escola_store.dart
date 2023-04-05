import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import '../../stores/stores.dart';
import '../helpers/helpers.dart';
import '../repositories/repositories.dart';
import '../models/models.dart';

part 'escola_store.g.dart';

class EscolaStore = _EscolaStore with _$EscolaStore;

abstract class _EscolaStore with Store {
  final AuthStore authStore = GetIt.I<AuthStore>();

  _EscolaStore() {
    _user = authStore.userAuth;

    _loadEscolas();
  }
  User? _user;

  ObservableList<Escola> escolaList = ObservableList<Escola>();

  @observable
  String? error;

  @computed
  List<Escola> get allTurma => List.from(escolaList)
    ..insert(
        0,
        Escola(
            id: "*",
            nome: 'Todas',
            localizacao: LatLng(1, 1),
            distanciaFila: 100));

  @action
  void setError(String value) => error = value;

  void setEscola(List<Escola> escolas) {
    escolaList.clear();
    escolaList.addAll(escolas);
  }

  Future<void> _loadEscolas() async {
    try {
      final escolas = await EscolaRepo().getList();
      setEscola(escolas);
    } catch (e) {
      setError(e.toString());
    }
  }
}
