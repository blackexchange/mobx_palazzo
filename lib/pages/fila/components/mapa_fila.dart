import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../models/models.dart';
import '../../../stores/stores.dart';

class MapaFila extends StatelessWidget {
  final FilaStore filaStore = GetIt.I<FilaStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Observer(builder: (_) {
        return IconButton(
            onPressed: filaStore.getLocation,
            icon: Icon(
              Icons.location_on_outlined,
              size: 32,
            ));
      }),
      appBar: AppBar(
        title: Text('Fila'),
      ),
      body: Builder(builder: (_) {
        if (filaStore.currentLocation == null)
          return Center(
            child: CircularProgressIndicator(),
          );
        if (filaStore.loading) return CircularProgressIndicator();
        return Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: filaStore.currentLocation!,
                    zoom: 50,
                  ),
                  markers: Set<Marker>.of([
                    Marker(
                      markerId: MarkerId('destination'),
                      position: filaStore
                          .matriculaSelecionada!.turma!.escola!.localizacao!,
                    ),
                    Marker(
                      markerId: MarkerId('current'),
                      position: filaStore.currentLocation!,
                    ),
                  ]),
                ),
              ),
            ),
            Observer(builder: (_) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(filaStore.loading
                    ? ''
                    : 'Você está a ${filaStore.distance.toStringAsFixed(1)} metros da fila.'),
              );
            }),
            Observer(builder: (_) {
              if (filaStore.loading) return CircularProgressIndicator();
              return ElevatedButton(
                  onPressed: filaStore.activeCheckin,
                  child:
                      Text(filaStore.distante ? 'DISTANTE' : 'ENTRAR NA FILA'));
            }),
          ],
        );
      }),
    );
  }
}
