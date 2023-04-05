import 'package:flutter/material.dart';
import '../../../models/models.dart';

class MatriculaTile extends StatelessWidget {
  final Matricula m;

  MatriculaTile(this.m);

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
          trailing: MatriculaStatus.ATIVO.index == m.status.index
              ? Icon(
                  Icons.online_prediction,
                  color: Colors.green,
                )
              : Icon(
                  Icons.pending,
                  color: Colors.yellow,
                ),
        ),
      ),
    );
  }
}
