import 'package:mobx/mobx.dart';
import '../models/models.dart';
import '../helpers/helpers.dart';
import '../repositories/repositories.dart';

part 'cep_store.g.dart';

class CEPStore = _CEPStore with _$CEPStore;

abstract class _CEPStore with Store {
  _CEPStore() {
    autorun((_) {
      if (clearCep.length != 8) {
        _reset();
      } else {
        _searchCep();
      }
    });
  }

  @observable
  String cep = '';

  @observable
  String? error;

  @action
  void setCep(String value) => cep = value;

  @computed
  String get clearCep => cep.replaceAll(RegExp('[^0-9]'), "");

  @observable
  Address? address;

  @observable
  bool loading = false;

  @action
  Future<void> _searchCep() async {
    loading = true;
    try {
      address = await CepRepo().getAddress(clearCep);
      error = null;
    } catch (e) {
      error = e.toString();
      address = null;
    }
    loading = false;
  }

  @action
  void _reset() {
    address = null;
    error = null;
  }
}
