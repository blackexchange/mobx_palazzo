// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turma_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TurmaStore on _TurmaStore, Store {
  Computed<List<Turma>>? _$allTurmaComputed;

  @override
  List<Turma> get allTurma =>
      (_$allTurmaComputed ??= Computed<List<Turma>>(() => super.allTurma,
              name: '_TurmaStore.allTurma'))
          .value;

  late final _$errorAtom = Atom(name: '_TurmaStore.error', context: context);

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

  late final _$_TurmaStoreActionController =
      ActionController(name: '_TurmaStore', context: context);

  @override
  void setError(String value) {
    final _$actionInfo =
        _$_TurmaStoreActionController.startAction(name: '_TurmaStore.setError');
    try {
      return super.setError(value);
    } finally {
      _$_TurmaStoreActionController.endAction(_$actionInfo);
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
