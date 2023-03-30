import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../stores/stores.dart';
import '../models/models.dart';
import '../helpers/helpers.dart';
import '../repositories/repositories.dart';

part 'matricula_store.g.dart';

class MatriculaStore = _MatriculaStore with _$MatriculaStore;

abstract class _MatriculaStore with Store {
  ObservableList images = ObservableList();

  CEPStore cepStore = CEPStore();

  @computed
  Address? get address => cepStore.address;
  bool get addressValid => address != null;
  String? get addressError {
    if (!showErrors || addressValid) {
      return null;
    } else {
      'Campo obrigatório';
    }
  }

  @computed
  bool get imagesValid => images.isNotEmpty;
  String? get imagesError {
    if (!showErrors || imagesValid) {
      return null;
    } else {
      return 'Insira imagens';
    }
  }

  @observable
  String valorText = '';

  @action
  void setPreco(String value) => valorText = value;

  @computed
  double? get valor {
    if (valorText.contains(',')) {
      return double.tryParse(valorText.replaceAll(RegExp('[^0-9]'), ''));
    } else {
      return double.tryParse(valorText);
    }
  }

  bool get precoValido => valor != null && valor! <= 9999999;
  String? get precoErro {
    if (!showErrors || precoValido)
      return null;
    else
      return 'Preço inválido';
  }

  @observable
  Turma? turma;

  @observable
  bool hideEspecial = false;

  @observable
  String? nome;

  @observable
  String? email;

  @observable
  String? phone;

  @action
  void setTurma(Turma value) => turma = value;

  @observable
  bool matriculaSaved = false;

  @computed
  bool get turmaValid => turma != null;
  String? get turmaError {
    if (!showErrors || turmaValid) {
      return null;
    } else {
      return 'Turma inválida';
    }
  }

  @action
  void setNome(String value) => nome = value;

  @action
  void setEmail(String value) => email = value;
  @computed
  bool get emailInvalid => email != null && email!.length >= 6;
  String? get emailError {
    if (!showErrors || emailInvalid) {
      return null;
    } else {
      return 'E-mail inválido';
    }
  }

  @action
  void setPhone(String value) => phone = value;
  @computed
  bool get phoneInvalid => phone != null && phone!.length >= 6;
  String? get phoneError {
    if (!showErrors || phoneInvalid) {
      return null;
    } else {
      return 'Telefone inválido';
    }
  }

  @computed
  bool get nomeValid => nome != null && nome!.length >= 6;
  String? get nomeError {
    if (!showErrors || nomeValid) {
      return null;
    } else {
      return 'Nome inválido';
    }
  }

  @action
  void setEspecial(bool? value) => hideEspecial = value!;

  @computed
  bool get formValid => nomeValid && addressValid && turmaValid;

  void Function()? get sendPressed => formValid ? _send : null;

  @observable
  bool isLoading = false;

  @observable
  bool showErrors = false;

  @observable
  String? error;

  @action
  void invalidSendPressed() => showErrors = true;

  @action
  Future<void> _send() async {
    isLoading = true;

    final matricula = Matricula(
        nome: nome,
        address: address,
        especial: hideEspecial,
        turma: turma,
        phone: phone,
        status: MatriculaStatus.PENDENTE,
        email: email,
        user: GetIt.I<AuthStore>().userAuth);

    MatriculaRepo m = MatriculaRepo();
    try {
      await m.save(matricula);
      matriculaSaved = true;
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
  }
}
