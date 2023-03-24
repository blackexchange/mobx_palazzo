import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../pages/pages.dart';

import '../../../stores/stores.dart';

class TurmaField extends StatelessWidget {
  final MatriculaStore? matriculaStore;

  TurmaField(this.matriculaStore);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          ListTile(
              title: matriculaStore?.turma == null
                  ? const Text(
                      "Turma *",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    )
                  : const Text(
                      "Turma *",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
              subtitle: matriculaStore?.turma == null
                  ? null
                  : Text(
                      '${matriculaStore?.turma?.title}',
                      style: const TextStyle(color: Colors.black, fontSize: 17),
                    ),
              trailing: const Icon(Icons.keyboard_arrow_down),
              onTap: () async {
                final turma = await showDialog(
                    context: context,
                    builder: (_) => TurmaPageList(
                          showAll: false,
                          turmaSelected: matriculaStore?.turma,
                        ));

                if (turma != null) {
                  matriculaStore?.setTurma(turma);
                }
              }),
          Observer(builder: (_) {
            if (matriculaStore?.turmaError != null)
              return Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.red))),
                child: Text(
                  matriculaStore!.turmaError!,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              );
            return Container();
          })
        ],
      );
    });
  }
}
