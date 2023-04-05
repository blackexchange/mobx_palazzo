// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escola_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EscolaStore on _EscolaStore, Store {
  Computed<List<Escola>>? _$allTurmaComputed;

  @override
  List<Escola> get allTurma =>
      (_$allTurmaComputed ??= Computed<List<Escola>>(() => super.allTurma,
              name: '_EscolaStore.allTurma'))
          .value;

  late final _$errorAtom = Atom(name: '_EscolaStore.error', context: context);

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

  late final _$_EscolaStoreActionController =
      ActionController(name: '_EscolaStore', context: context);

  @override
  void setError(String value) {
    final _$actionInfo = _$_EscolaStoreActionController.startAction(
        name: '_EscolaStore.setError');
    try {
      return super.setError(value);
    } finally {
      _$_EscolaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
allTurma: ${allTurma}
    ''';
  }
}
