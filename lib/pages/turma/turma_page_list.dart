import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../pages/pages.dart';
import '../../stores/stores.dart';

import '../../models/models.dart';

class TurmaPageList extends StatelessWidget {
  final Turma? turmaSelected;
  final bool showAll;

  TurmaPageList({this.showAll = true, this.turmaSelected});

  final TurmaStore turmaStore = GetIt.I<TurmaStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Turma'),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.fromLTRB(32, 12, 32, 32),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          child: Observer(builder: (_) {
            if (turmaStore.error != null) {
              return ErrorBox(turmaStore.error);
            } else if (turmaStore.turmaList.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final turmas =
                  showAll ? turmaStore.allTurma : turmaStore.turmaList;

              return ListView.separated(
                itemCount: turmas.length,
                separatorBuilder: (_, __) {
                  return Divider(height: 0.1, color: Colors.grey);
                },
                itemBuilder: ((_, index) {
                  final turma = turmas[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pop(turma);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      color: turma.id == turmaSelected?.id
                          ? Colors.blueAccent.withAlpha(50)
                          : null,
                      child: Text(
                        turma.title,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: turma.id == turmaSelected?.id
                                ? FontWeight.bold
                                : null),
                      ),
                    ),
                  );
                }),
              );
            }
          }),
        ),
      ),
    );
  }
}
