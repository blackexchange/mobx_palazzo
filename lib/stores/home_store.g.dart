// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$errorAtom = Atom(name: '_HomeStore.error', context: context);

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

  late final _$loadingAtom = Atom(name: '_HomeStore.loading', context: context);

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

  late final _$searchAtom = Atom(name: '_HomeStore.search', context: context);

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

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void setError(String? value) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setError');
    try {
      return super.setError(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String value) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
loading: ${loading},
search: ${search}
    ''';
  }
}
