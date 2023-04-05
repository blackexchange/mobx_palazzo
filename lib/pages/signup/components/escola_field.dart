import 'package:escolaflow/pages/escola/escola_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../pages/pages.dart';

import '../../../stores/stores.dart';

class EscolaField extends StatelessWidget {
  SignUpStore? signUpStore = SignUpStore();
  EscolaField(this.signUpStore);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          ListTile(
              title: signUpStore?.escola == null
                  ? const Text(
                      "Escola *",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    )
                  : const Text(
                      "Escola *",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
              subtitle: signUpStore?.escola == null
                  ? null
                  : Text(
                      '${signUpStore?.escola?.nome}',
                      style: const TextStyle(color: Colors.black, fontSize: 17),
                    ),
              trailing: const Icon(Icons.keyboard_arrow_down),
              onTap: () async {
                final escola = await showDialog(
                    context: context,
                    builder: (_) => EscolaListPage(
                          selected: signUpStore?.escola,
                        ));

                if (escola != null) {
                  signUpStore?.setEscola(escola);
                }
              }),
          Observer(builder: (_) {
            if (signUpStore?.escolaError != null)
              return Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.red))),
                child: Text(
                  signUpStore!.escolaError!,
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
