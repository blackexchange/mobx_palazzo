import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import '../models/models.dart';
import '../stores/stores.dart';
import '../helpers/helpers.dart';
import '../repositories/repositories.dart';
import 'package:geolocator/geolocator.dart';

import 'my_fila_store.dart';

part 'my_fila_store.g.dart';

class MyFilaStore = _MyFilaStore with _$MyFilaStore;

abstract class _MyFilaStore with Store {
  final AuthStore authStore = GetIt.I<AuthStore>();

  _MyFilaStore() {
    _user = authStore.userAuth;
    _getMyFila();
  }

  User? _user;

  ObservableList<Fila?> filaList = ObservableList<Fila>();
  ObservableList<Fila?> filaListAtiva = ObservableList<Fila>();

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  Future<void> _getMyFila() async {
    setLoading(true);

    final listaF = await FilaRepo().getMyFila(_user!);

    filaList.clear();

    filaList.addAll(listaF);
    filaList.removeWhere((element) => element!.status != FilaStatus.SAIUDAFILA);

    filaListAtiva.addAll(listaF);
    filaListAtiva
        .removeWhere((element) => element!.status == FilaStatus.SAIUDAFILA);

    setLoading(false);
  }
}
