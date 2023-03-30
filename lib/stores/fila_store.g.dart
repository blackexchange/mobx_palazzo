// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fila_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FilaStore on _FilaStore, Store {
  late final _$matriculaSelecionadaAtom =
      Atom(name: '_FilaStore.matriculaSelecionada', context: context);

  @override
  Matricula? get matriculaSelecionada {
    _$matriculaSelecionadaAtom.reportRead();
    return super.matriculaSelecionada;
  }

  @override
  set matriculaSelecionada(Matricula? value) {
    _$matriculaSelecionadaAtom.reportWrite(value, super.matriculaSelecionada,
        () {
      super.matriculaSelecionada = value;
    });
  }

  late final _$pageAtom = Atom(name: '_FilaStore.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$errorAtom = Atom(name: '_FilaStore.error', context: context);

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

  late final _$loadingAtom = Atom(name: '_FilaStore.loading', context: context);

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

  late final _$distanteAtom =
      Atom(name: '_FilaStore.distante', context: context);

  @override
  bool get distante {
    _$distanteAtom.reportRead();
    return super.distante;
  }

  @override
  set distante(bool value) {
    _$distanteAtom.reportWrite(value, super.distante, () {
      super.distante = value;
    });
  }

  late final _$distanceAtom =
      Atom(name: '_FilaStore.distance', context: context);

  @override
  double get distance {
    _$distanceAtom.reportRead();
    return super.distance;
  }

  @override
  set distance(double value) {
    _$distanceAtom.reportWrite(value, super.distance, () {
      super.distance = value;
    });
  }

  late final _$currentLocationAtom =
      Atom(name: '_FilaStore.currentLocation', context: context);

  @override
  LatLng? get currentLocation {
    _$currentLocationAtom.reportRead();
    return super.currentLocation;
  }

  @override
  set currentLocation(LatLng? value) {
    _$currentLocationAtom.reportWrite(value, super.currentLocation, () {
      super.currentLocation = value;
    });
  }

  late final _$destinationAtom =
      Atom(name: '_FilaStore.destination', context: context);

  @override
  LatLng? get destination {
    _$destinationAtom.reportRead();
    return super.destination;
  }

  @override
  set destination(LatLng? value) {
    _$destinationAtom.reportWrite(value, super.destination, () {
      super.destination = value;
    });
  }

  late final _$determinePositionAsyncAction =
      AsyncAction('_FilaStore.determinePosition', context: context);

  @override
  Future<Position> determinePosition() {
    return _$determinePositionAsyncAction.run(() => super.determinePosition());
  }

  late final _$_FilaStoreActionController =
      ActionController(name: '_FilaStore', context: context);

  @override
  void loadNextPage() {
    final _$actionInfo = _$_FilaStoreActionController.startAction(
        name: '_FilaStore.loadNextPage');
    try {
      return super.loadNextPage();
    } finally {
      _$_FilaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDistance(double value) {
    final _$actionInfo = _$_FilaStoreActionController.startAction(
        name: '_FilaStore.setDistance');
    try {
      return super.setDistance(value);
    } finally {
      _$_FilaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMatricula(Matricula value) {
    final _$actionInfo = _$_FilaStoreActionController.startAction(
        name: '_FilaStore.setMatricula');
    try {
      return super.setMatricula(value);
    } finally {
      _$_FilaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentLocation(LatLng value) {
    final _$actionInfo = _$_FilaStoreActionController.startAction(
        name: '_FilaStore.setCurrentLocation');
    try {
      return super.setCurrentLocation(value);
    } finally {
      _$_FilaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDestination(LatLng value) {
    final _$actionInfo = _$_FilaStoreActionController.startAction(
        name: '_FilaStore.setDestination');
    try {
      return super.setDestination(value);
    } finally {
      _$_FilaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDistante(bool value) {
    final _$actionInfo = _$_FilaStoreActionController.startAction(
        name: '_FilaStore.setDistante');
    try {
      return super.setDistante(value);
    } finally {
      _$_FilaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setError(String? value) {
    final _$actionInfo =
        _$_FilaStoreActionController.startAction(name: '_FilaStore.setError');
    try {
      return super.setError(value);
    } finally {
      _$_FilaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo =
        _$_FilaStoreActionController.startAction(name: '_FilaStore.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_FilaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
matriculaSelecionada: ${matriculaSelecionada},
page: ${page},
error: ${error},
loading: ${loading},
distante: ${distante},
distance: ${distance},
currentLocation: ${currentLocation},
destination: ${destination}
    ''';
  }
}
