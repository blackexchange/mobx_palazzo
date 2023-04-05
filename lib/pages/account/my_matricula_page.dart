import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../models/models.dart';
import '../../stores/stores.dart';

import '../components/components.dart';
//import './components/components.dart';

class MyMatriculaPage extends StatelessWidget {
  final AuthStore authStore = GetIt.I<AuthStore>();

  //final List<Matricula> matriculas;

  MyMatriculaPage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () async {
                      await authStore.atualizaMatriculaUsuario();
                    },
                    icon: Icon(Icons.refresh))
              ],
            ),
            body: ListView.builder(
                itemCount: authStore.userAuth?.matriculas!.length,
                itemBuilder: (_, i) {
                  final a = authStore.userAuth?.matriculas![i];
                  return Card(
                    child: ListTile(
                      title: Text(a!.nome!),
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
