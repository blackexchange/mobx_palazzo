// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_UserStore.isLoading', context: context);

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

  late final _$errorAtom = Atom(name: '_UserStore.error', context: context);

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

  late final _$loadingAtom = Atom(name: '_UserStore.loading', context: context);

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

  late final _$searchAtom = Atom(name: '_UserStore.search', context: context);

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$atualizaMatriculaUsuarioAsyncAction =
      AsyncAction('_UserStore.atualizaMatriculaUsuario', context: context);

  @override
  Future<void> atualizaMatriculaUsuario(User u) {
    return _$atualizaMatriculaUsuarioAsyncAction
        .run(() => super.atualizaMatriculaUsuario(u));
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  void setError(String? value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setError');
    try {
      return super.setError(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
loading: ${loading},
search: ${search}
    ''';
  }
}
