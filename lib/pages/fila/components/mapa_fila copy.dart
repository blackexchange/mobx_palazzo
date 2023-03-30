import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:io' show Platform;

class MapaFila extends StatefulWidget {
  @override
  _MapaFilaState createState() => _MapaFilaState();
}

class _MapaFilaState extends State<MapaFila> {
  static const String _kLocationServicesDisabledMessage =
      'Location services are disabled.';
  static const String _kPermissionDeniedMessage = 'Permission denied.';
  static const String _kPermissionDeniedForeverMessage =
      'Permission denied forever.';
  static const String _kPermissionGrantedMessage = 'Permission granted.';

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  //final List<_PositionItem> _positionItems = <_PositionItem>[];
  StreamSubscription<Position>? _positionStreamSubscription;
  StreamSubscription<ServiceStatus>? _serviceStatusStreamSubscription;
  bool positionStreamStarted = false;

  LatLng? _currentLocation;
  LatLng _destination =
      LatLng(-12.975758, -38.5051772); // coordenada de exemplo
  double? _distance;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
      _distance = _calculateDistance(_currentLocation!, _destination);
    });
  }

  double _calculateDistance(LatLng start, LatLng end) {
    return Geolocator.distanceBetween(
        start.latitude, start.longitude, end.latitude, end.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
      ),
      body: _currentLocation == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _currentLocation!,
                      zoom: 15,
                    ),
                    markers: Set<Marker>.of([
                      Marker(
                        markerId: MarkerId('destination'),
                        position: _destination,
                      ),
                      Marker(
                        markerId: MarkerId('current'),
                        position: _currentLocation!,
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Distance: $_distance m'),
                ),
                _distance! <= 10
                    ? ElevatedButton(
                        onPressed: () {
                          // Ação a ser realizada quando o botão é pressionado
                        },
                        child: Text('Botão de ação'),
                      )
                    : SizedBox(),
              ],
            ),
    );
  }
}
