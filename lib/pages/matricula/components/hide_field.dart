import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../stores/matricula_store.dart';

class HideField extends StatelessWidget {
  final MatriculaStore matriculaStore;

  HideField(this.matriculaStore);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Row(
        children: [
          Observer(builder: (_) {
            return Checkbox(
                activeColor: Theme.of(context).primaryColor,
                value: matriculaStore.hideEspecial,
                onChanged: matriculaStore.setEspecial);
          }),
          Expanded(child: Text("Necessidades especiais"))
        ],
      ),
    );
  }
}
