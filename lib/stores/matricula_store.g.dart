// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matricula_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MatriculaStore on _MatriculaStore, Store {
  Computed<Address?>? _$addressComputed;

  @override
  Address? get address =>
      (_$addressComputed ??= Computed<Address?>(() => super.address,
              name: '_MatriculaStore.address'))
          .value;
  Computed<bool>? _$imagesValidComputed;

  @override
  bool get imagesValid =>
      (_$imagesValidComputed ??= Computed<bool>(() => super.imagesValid,
              name: '_MatriculaStore.imagesValid'))
          .value;
  Computed<double?>? _$valorComputed;

  @override
  double? get valor => (_$valorComputed ??=
          Computed<double?>(() => super.valor, name: '_MatriculaStore.valor'))
      .value;
  Computed<bool>? _$turmaValidComputed;

  @override
  bool get turmaValid =>
      (_$turmaValidComputed ??= Computed<bool>(() => super.turmaValid,
              name: '_MatriculaStore.turmaValid'))
          .value;
  Computed<bool>? _$emailInvalidComputed;

  @override
  bool get emailInvalid =>
      (_$emailInvalidComputed ??= Computed<bool>(() => super.emailInvalid,
              name: '_MatriculaStore.emailInvalid'))
          .value;
  Computed<bool>? _$phoneInvalidComputed;

  @override
  bool get phoneInvalid =>
      (_$phoneInvalidComputed ??= Computed<bool>(() => super.phoneInvalid,
              name: '_MatriculaStore.phoneInvalid'))
          .value;
  Computed<bool>? _$nomeValidComputed;

  @override
  bool get nomeValid =>
      (_$nomeValidComputed ??= Computed<bool>(() => super.nomeValid,
              name: '_MatriculaStore.nomeValid'))
          .value;
  Computed<bool>? _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid,
              name: '_MatriculaStore.formValid'))
          .value;

  late final _$valorTextAtom =
      Atom(name: '_MatriculaStore.valorText', context: context);

  @override
  String get valorText {
    _$valorTextAtom.reportRead();
    return super.valorText;
  }

  @override
  set valorText(String value) {
    _$valorTextAtom.reportWrite(value, super.valorText, () {
      super.valorText = value;
    });
  }

  late final _$turmaAtom =
      Atom(name: '_MatriculaStore.turma', context: context);

  @override
  Turma? get turma {
    _$turmaAtom.reportRead();
    return super.turma;
  }

  @override
  set turma(Turma? value) {
    _$turmaAtom.reportWrite(value, super.turma, () {
      super.turma = value;
    });
  }

  late final _$hideEspecialAtom =
      Atom(name: '_MatriculaStore.hideEspecial', context: context);

  @override
  bool get hideEspecial {
    _$hideEspecialAtom.reportRead();
    return super.hideEspecial;
  }

  @override
  set hideEspecial(bool value) {
    _$hideEspecialAtom.reportWrite(value, super.hideEspecial, () {
      super.hideEspecial = value;
    });
  }

  late final _$nomeAtom = Atom(name: '_MatriculaStore.nome', context: context);

  @override
  String? get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String? value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_MatriculaStore.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$phoneAtom =
      Atom(name: '_MatriculaStore.phone', context: context);

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$matriculaSavedAtom =
      Atom(name: '_MatriculaStore.matriculaSaved', context: context);

  @override
  bool get matriculaSaved {
    _$matriculaSavedAtom.reportRead();
    return super.matriculaSaved;
  }

  @override
  set matriculaSaved(bool value) {
    _$matriculaSavedAtom.reportWrite(value, super.matriculaSaved, () {
      super.matriculaSaved = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_MatriculaStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$showErrorsAtom =
      Atom(name: '_MatriculaStore.showErrors', context: context);

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_MatriculaStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$_sendAsyncAction =
      AsyncAction('_MatriculaStore._send', context: context);

  @override
  Future<void> _send() {
    return _$_sendAsyncAction.run(() => super._send());
  }

  late final _$_MatriculaStoreActionController =
      ActionController(name: '_MatriculaStore', context: context);

  @override
  void setPreco(String value) {
    final _$actionInfo = _$_MatriculaStoreActionController.startAction(
        name: '_MatriculaStore.setPreco');
    try {
      return super.setPreco(value);
    } finally {
      _$_MatriculaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTurma(Turma value) {
    final _$actionInfo = _$_MatriculaStoreActionController.startAction(
        name: '_MatriculaStore.setTurma');
    try {
      return super.setTurma(value);
    } finally {
      _$_MatriculaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNome(String value) {
    final _$actionInfo = _$_MatriculaStoreActionController.startAction(
        name: '_MatriculaStore.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_MatriculaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_MatriculaStoreActionController.startAction(
        name: '_MatriculaStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_MatriculaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_MatriculaStoreActionController.startAction(
        name: '_MatriculaStore.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_MatriculaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEspecial(bool? value) {
    final _$actionInfo = _$_MatriculaStoreActionController.startAction(
        name: '_MatriculaStore.setEspecial');
    try {
      return super.setEspecial(value);
    } finally {
      _$_MatriculaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$_MatriculaStoreActionController.startAction(
        name: '_MatriculaStore.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$_MatriculaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valorText: ${valorText},
turma: ${turma},
hideEspecial: ${hideEspecial},
nome: ${nome},
email: ${email},
phone: ${phone},
matriculaSaved: ${matriculaSaved},
isLoading: ${isLoading},
showErrors: ${showErrors},
error: ${error},
address: ${address},
imagesValid: ${imagesValid},
valor: ${valor},
turmaValid: ${turmaValid},
emailInvalid: ${emailInvalid},
phoneInvalid: ${phoneInvalid},
nomeValid: ${nomeValid},
formValid: ${formValid}
    ''';
  }
}
