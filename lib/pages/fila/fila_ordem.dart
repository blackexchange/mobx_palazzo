import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../helpers/helpers.dart';

import '../../models/models.dart';
import '../../stores/stores.dart';

import '../components/components.dart';
import './components/components.dart';

class FilaOrdem extends StatelessWidget {
  final FilaStore filaStore = GetIt.I<FilaStore>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () async {
                      // await filaStore.atualizaMatriculaUsuario(u);
                    },
                    icon: Icon(Icons.add))
              ],
            ),
            body: Observer(builder: (_) {
              return ListView.builder(
                  itemCount: filaStore.filaList.length,
                  itemBuilder: (_, i) {
                    final a = filaStore.filaList[i];
                    return Card(
                      child: ListTile(
                        title: Text(a.matricula!.nome!),
                        subtitle: Text(a.createdAt.toString()),
                        trailing: a.status == FilaStatus.NAFILA
                            ? Icon(
                                Icons.car_repair,
                                color: Colors.green,
                              )
                            : null,
                      ),
                    );
                  });
            })));
  }
}
