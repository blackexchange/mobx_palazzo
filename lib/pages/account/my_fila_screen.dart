import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../helpers/helpers.dart';

import '../../models/models.dart';
import '../../stores/stores.dart';

class MyFilaScreen extends StatefulWidget {
  @override
  State<MyFilaScreen> createState() => _MyFilaScreenState();
}

class _MyFilaScreenState extends State<MyFilaScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final MyFilaStore myFilaStore = MyFilaStore();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  //final List<Matricula> matriculas;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Filas"),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () async {
                      // await userStore.atualizaMatriculaUsuario(u);
                    },
                    icon: Icon(Icons.add))
              ],
              bottom: TabBar(controller: tabController, tabs: [
                Tab(child: Text('Buscas Realizadas')),
                Tab(child: Text('Buscas Ativas'))
              ]),
            ),
            body: TabBarView(
              controller: tabController,
              children: [
                Observer(builder: (_) {
                  if (myFilaStore.loading) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    );
                  }
                  return Container(
                      //   color: Colors.amber,
                      child: ListView.builder(
                          itemCount: myFilaStore.filaList.length,
                          itemBuilder: (_, i) {
                            final f = myFilaStore.filaList[i];
                            return Card(
                                child: ListTile(
                              title: Text(f!.matricula!.nome!),
                              subtitle: Text(f.createdAt!.formattedDateTime()),
                            ));
                          }));
                }),
                Observer(builder: (_) {
                  if (myFilaStore.loading) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    );
                  }
                  return Container(
                      //   color: Colors.amber,
                      child: ListView.builder(
                          itemCount: myFilaStore.filaListAtiva.length,
                          itemBuilder: (_, i) {
                            final f = myFilaStore.filaListAtiva[i];
                            return Card(
                                child: ListTile(
                              title: Text(f!.matricula!.nome!),
                              leading: f.status == FilaStatus.NAROTA
                                  ? Icon(
                                      Icons.car_crash_outlined,
                                      size: 32,
                                      color: Theme.of(context).primaryColor,
                                    )
                                  : Icon(
                                      Icons.person_pin_circle_outlined,
                                      size: 32,
                                      color:
                                          Theme.of(context).primaryColorLight,
                                    ),
                              subtitle: Text(f.createdAt!.formattedDateTime()),
                            ));
                          }));
                }),
              ],
            )));
  }
}
