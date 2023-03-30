// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccountStore on _AccountStore, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_AccountStore.nameValid'))
          .value;
  Computed<VoidCallback?>? _$sendComputed;

  @override
  VoidCallback? get send => (_$sendComputed ??=
          Computed<VoidCallback?>(() => super.send, name: '_AccountStore.send'))
      .value;

  late final _$userTypeAtom =
      Atom(name: '_AccountStore.userType', context: context);

  @override
  UserType? get userType {
    _$userTypeAtom.reportRead();
    return super.userType;
  }

  @override
  set userType(UserType? value) {
    _$userTypeAtom.reportWrite(value, super.userType, () {
      super.userType = value;
    });
  }

  late final _$nameAtom = Atom(name: '_AccountStore.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$phoneAtom = Atom(name: '_AccountStore.phone', context: context);

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

  late final _$pass1Atom = Atom(name: '_AccountStore.pass1', context: context);

  @override
  String get pass1 {
    _$pass1Atom.reportRead();
    return super.pass1;
  }

  @override
  set pass1(String value) {
    _$pass1Atom.reportWrite(value, super.pass1, () {
      super.pass1 = value;
    });
  }

  late final _$pass2Atom = Atom(name: '_AccountStore.pass2', context: context);

  @override
  String get pass2 {
    _$pass2Atom.reportRead();
    return super.pass2;
  }

  @override
  set pass2(String value) {
    _$pass2Atom.reportWrite(value, super.pass2, () {
      super.pass2 = value;
    });
  }

  late final _$formValidAtom =
      Atom(name: '_AccountStore.formValid', context: context);

  @override
  bool get formValid {
    _$formValidAtom.reportRead();
    return super.formValid;
  }

  @override
  set formValid(bool value) {
    _$formValidAtom.reportWrite(value, super.formValid, () {
      super.formValid = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_AccountStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$_sendAsyncAction =
      AsyncAction('_AccountStore._send', context: context);

  @override
  Future<void> _send() {
    return _$_sendAsyncAction.run(() => super._send());
  }

  late final _$_AccountStoreActionController =
      ActionController(name: '_AccountStore', context: context);

  @override
  void setUserType(int? value) {
    final _$actionInfo = _$_AccountStoreActionController.startAction(
        name: '_AccountStore.setUserType');
    try {
      return super.setUserType(value);
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_AccountStoreActionController.startAction(
        name: '_AccountStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_AccountStoreActionController.startAction(
        name: '_AccountStore.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass1(String value) {
    final _$actionInfo = _$_AccountStoreActionController.startAction(
        name: '_AccountStore.setPass1');
    try {
      return super.setPass1(value);
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass2(String value) {
    final _$actionInfo = _$_AccountStoreActionController.startAction(
        name: '_AccountStore.setPass2');
    try {
      return super.setPass2(value);
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userType: ${userType},
name: ${name},
phone: ${phone},
pass1: ${pass1},
pass2: ${pass2},
formValid: ${formValid},
loading: ${loading},
nameValid: ${nameValid},
send: ${send}
    ''';
  }
}
