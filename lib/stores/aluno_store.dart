import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_palazzo/models/user.dart';
import '../helpers/helpers.dart';
import '../repositories/repositories.dart';

part 'aluno_store.g.dart';

class AlunoStore = _AlunoStore with _$AlunoStore;

abstract class _AlunoStore with Store {
  ObservableList images = ObservableList();
}
