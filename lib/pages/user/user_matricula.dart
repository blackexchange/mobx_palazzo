import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../models/models.dart';
import '../../stores/stores.dart';

import '../components/components.dart';
import './components/components.dart';

class UserMatricula extends StatelessWidget {
  final UserStore userStore = GetIt.I<UserStore>();

  //final List<Matricula> matriculas;

  final User u;

  UserMatricula(this.u);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () async {
                      await userStore.atualizaMatriculaUsuario(u);
                    },
                    icon: Icon(Icons.add))
              ],
            ),
            body: ListView.builder(
                itemCount: u.matriculas!.length,
                itemBuilder: (_, i) {
                  final a = u.matriculas![i];
                  return Card(
                    child: ListTile(
                      title: Text(a.nome!),
                      subtitle: Text(a.turma!.title),
                      trailing: a.status == MatriculaStatus.ATIVO
                          ? Icon(
                              Icons.online_prediction,
                              color: Colors.green,
                            )
                          : null,
                    ),
                  );
                })));
  }
}
