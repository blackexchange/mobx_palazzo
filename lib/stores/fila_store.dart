import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_palazzo/models/models.dart';
import '../helpers/helpers.dart';
import '../repositories/repositories.dart';
import 'package:geolocator/geolocator.dart';

import 'auth_store.dart';

part 'fila_store.g.dart';

class FilaStore = _FilaStore with _$FilaStore;

abstract class _FilaStore with Store {
  _FilaStore() {
    autorun((_) async {
      getLocation();

      try {
        setLoading(true);

        final users = await FilaRepo().getFila();
        filaList.clear();
        filaList.addAll(users!);
        setError(null);
        setLoading(false);
      } catch (e) {
        setError(e.toString());
      }
    });
  }

  ObservableList<Fila> filaList = ObservableList<Fila>();

  @observable
  Matricula? matriculaSelecionada;

  @observable
  int page = 0;

  @action
  void loadNextPage() {
    page++;
  }

  @observable
  String? error;

  @observable
  bool loading = false;

  @observable
  bool distante = true;

  @observable
  double distance = 0.0;

  @observable
  LatLng? currentLocation;

  @observable
  LatLng? destination;

  @action
  setDistance(double value) => distance = value;

  @action
  setMatricula(Matricula value) => matriculaSelecionada = value;

  @action
  setCurrentLocation(LatLng value) => currentLocation = value;

  @action
  setDestination(LatLng value) => destination = value;

  void Function()? get activeCheckin => !distante ? _entraNaFila : null;

  @action
  setDistante(bool value) => distante = value;

  @action
  setError(String? value) => error = value;

  @action
  setLoading(bool value) => loading = value;

  @action
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getLocation() async {
    setLoading(true);

    try {
      Position position = await determinePosition();
      final LatLng destination = LatLng(-12.967748, -38.49356322);

      setCurrentLocation(LatLng(position.latitude, position.longitude));
      setDistance(_calculateDistance(currentLocation!, destination));
      if (distance <= 100) {
        setDistante(false);
      } else {
        setDistante(true);
      }
      setLoading(false);
    } catch (e) {
      setError(e.toString());
    }
  }

  double _calculateDistance(LatLng start, LatLng end) {
    return Geolocator.distanceBetween(
        start.latitude, start.longitude, end.latitude, end.longitude);
  }

  Future<void> _entraNaFila() async {
    setLoading(true);

    final AuthStore auth = GetIt.I<AuthStore>();

    final fila =
        Fila(matricula: matriculaSelecionada, responsavel: auth.userAuth);

    FilaRepo f = FilaRepo();
    try {
      await f.save(fila);
      // matriculaSaved = true;
    } catch (e) {
      error = e.toString();
    }
    setLoading(false);
  }
}
