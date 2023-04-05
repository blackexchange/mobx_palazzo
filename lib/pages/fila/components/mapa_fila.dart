import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../models/models.dart';
import '../../../stores/stores.dart';

class MapaFila extends StatefulWidget {
  @override
  State<MapaFila> createState() => _MapaFilaState();
}

class _MapaFilaState extends State<MapaFila> {
  final FilaStore filaStore = GetIt.I<FilaStore>();

  @override
  void initState() {
    _initLocation();

    super.initState();
  }

  Future<void> _initLocation() async {
    await filaStore.getLocation();
    //   await filaStore.atualizarFila();
  }

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
      body: Observer(builder: (_) {
        if (filaStore.currentLocation == null ||
            filaStore.matriculaSelecionada!.turma!.escola!.localizacao == null)
          return Center(
            child: CircularProgressIndicator(),
          );
        if (filaStore.loading)
          return Container(child: CircularProgressIndicator());
        return Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: filaStore.currentLocation!,
                    zoom: 14,
                  ),
                  markers: Set<Marker>.of([
                    Marker(
                      markerId: MarkerId('destino'),
                      position: filaStore
                          .matriculaSelecionada!.turma!.escola!.localizacao!,
                    ),
                    Marker(
                      markerId: MarkerId('atual'),
                      position: filaStore.currentLocation!,
                    ),
                  ]),
                ),
              ),
            ),
            if (filaStore.matriculaSelecionada?.filaStatus != FilaStatus.NAFILA)
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(filaStore.loading
                      ? ''
                      : 'Você está a ${filaStore.distance.toStringAsFixed(1)} metros da fila.'),
                );
              }),
            if (filaStore.matriculaSelecionada?.filaStatus == FilaStatus.NAFILA)
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                      filaStore.matriculaSelecionada!.posicaoNaFila.toString()),
                );
              }),
            if (filaStore.matriculaSelecionada?.filaStatus == FilaStatus.NAFILA)
              Observer(builder: (_) {
                if (filaStore.loading) return CircularProgressIndicator();
                return ElevatedButton(
                    onPressed: () async {
                      await filaStore.sairDaFila();
                      Navigator.of(context).pop();
                    },
                    child: Text('SAIR DA FILA'));
              }),
            if (filaStore.matriculaSelecionada?.filaStatus != FilaStatus.NAFILA)
              Observer(builder: (_) {
                if (filaStore.loading) return CircularProgressIndicator();
                return ElevatedButton(
                    onPressed: filaStore.activeCheckin,
                    style: ButtonStyle(),
                    child: Text(
                        filaStore.distante ? 'DISTANTE' : 'ENTRAR NA FILA'));
              }),
            SizedBox(
              height: 16,
            )
          ],
        );
      }),
    );
  }
}
