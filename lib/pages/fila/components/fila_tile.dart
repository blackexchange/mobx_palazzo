import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../stores/fila_store.dart';
import './mapa_fila.dart';

import '../../../models/models.dart';

class FilaTile extends StatelessWidget {
  final Matricula m;

  FilaTile(this.m);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          title: Text(
            m.nome!,
            style: TextStyle(fontSize: 14),
          ),
          subtitle: Text(m.turma!.title),
          // leading: Text(m.status.index.toString()),

          trailing: 1 == 1
              ? Icon(
                  Icons.online_prediction,
                  color: Colors.green,
                )
              : Icon(
                  Icons.pending,
                  color: Colors.yellow,
                ),
          onTap: () async {
            GetIt.I<FilaStore>().setMatricula(m);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MapaFila()),
            );
          },
        ),
      ),
    );
  }
}
