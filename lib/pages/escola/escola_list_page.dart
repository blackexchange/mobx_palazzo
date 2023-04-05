import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../pages/pages.dart';
import '../../stores/stores.dart';

import '../../models/models.dart';

class EscolaListPage extends StatelessWidget {
  final Escola? selected;

  EscolaListPage({this.selected});

  final EscolaStore escolaStore = EscolaStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escola'),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.fromLTRB(32, 12, 32, 32),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          child: Observer(builder: (_) {
            if (escolaStore.error != null) {
              return ErrorBox(escolaStore.error);
            } else if (escolaStore.escolaList.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.separated(
                itemCount: escolaStore.escolaList.length,
                separatorBuilder: (_, __) {
                  return Divider(height: 0.1, color: Colors.grey);
                },
                itemBuilder: ((_, index) {
                  final escola = escolaStore.escolaList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pop(escola);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      color: escola.id == selected?.id
                          ? Theme.of(context).primaryColorLight.withAlpha(60)
                          : null,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            escola.nome!,
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                                fontWeight: escola.id == selected?.id
                                    ? FontWeight.bold
                                    : null),
                          ),
                        ],
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
