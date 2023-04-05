// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  Computed<bool>? _$isAuthComputed;

  @override
  bool get isAuth => (_$isAuthComputed ??=
          Computed<bool>(() => super.isAuth, name: '_AuthStore.isAuth'))
      .value;

  late final _$userAuthAtom =
      Atom(name: '_AuthStore.userAuth', context: context);

  @override
  User? get userAuth {
    _$userAuthAtom.reportRead();
    return super.userAuth;
  }

  @override
  set userAuth(User? value) {
    _$userAuthAtom.reportWrite(value, super.userAuth, () {
      super.userAuth = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AuthStore.isLoading', context: context);

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

  late final _$errorAtom = Atom(name: '_AuthStore.error', context: context);

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

  late final _$atualizaMatriculaUsuarioAsyncAction =
      AsyncAction('_AuthStore.atualizaMatriculaUsuario', context: context);

  @override
  Future<void> atualizaMatriculaUsuario() {
    return _$atualizaMatriculaUsuarioAsyncAction
        .run(() => super.atualizaMatriculaUsuario());
  }

  late final _$_AuthStoreActionController =
      ActionController(name: '_AuthStore', context: context);

  @override
  dynamic setUser(User? value) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userAuth: ${userAuth},
isLoading: ${isLoading},
error: ${error},
isAuth: ${isAuth}
    ''';
  }
}
