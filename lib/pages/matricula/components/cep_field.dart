import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../stores/stores.dart';

class CEPField extends StatelessWidget {
  final CEPStore cepStore;
  final MatriculaStore matriculaStore;

  CEPField(this.matriculaStore) : cepStore = matriculaStore.cepStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Observer(builder: (_) {
          return TextFormField(
            onChanged: cepStore.setCep,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CepInputFormatter(),
            ],
            decoration: InputDecoration(
                labelText: 'CEP *',
                errorText: matriculaStore.addressError,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    color: Colors.grey),
                contentPadding: EdgeInsets.fromLTRB(16, 10, 12, 10)),
          );
        }),
        Observer(builder: (_) {
          if (cepStore.address == null &&
              cepStore.error == null &&
              !cepStore.loading)
            return Container();
          else if (cepStore.address == null && cepStore.error == null)
            return LinearProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation(Theme.of(context).primaryColor),
              backgroundColor: Colors.transparent,
            );
          else if (cepStore.error != null)
            return Container(
                alignment: Alignment.center,
                color: Colors.red.withAlpha(100),
                height: 50,
                padding: EdgeInsets.all(8),
                child: Text(
                  cepStore.error!,
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                ));
          else {
            final a = cepStore.address;
            return Container(
              alignment: Alignment.center,
              color: Theme.of(context).primaryColor.withAlpha(150),
              height: 50,
              padding: const EdgeInsets.all(8),
              child: Text(
                'Localização: ${a?.bairro}, ${a?.cidade.nome}, ${a?.uf.sigla}',
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              ),
            );
          }
        })
      ],
    );
  }
}
