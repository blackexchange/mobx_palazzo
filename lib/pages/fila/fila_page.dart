import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../stores/stores.dart';

import '../components/components.dart';
import './components/components.dart';

class FilaPage extends StatelessWidget {
  final AuthStore authStore = GetIt.I<AuthStore>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(title: Text('Buscar Criança')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Observer(builder: (_) {
              final m = authStore.userAuth!.matriculas!;

              if (m.length == 0) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        Icons.border_clear,
                        size: 100,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Humm... Não há registros!',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              }
              return ListView.builder(
                  itemCount: m.length,
                  itemBuilder: (_, i) {
                    return FilaTile(m[i]);
                  });
            })),
          ],
        ),
      ),
    );
  }
}
