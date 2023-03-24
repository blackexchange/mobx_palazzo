import 'dart:convert';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../pages.dart';
import '../../stores/stores.dart';
import './components/components.dart';

class MatriculaPage extends StatefulWidget {
  @override
  State<MatriculaPage> createState() => _MatriculaPageState();
}

class _MatriculaPageState extends State<MatriculaPage> {
  final MatriculaStore matriculaStore = MatriculaStore();

  @override
  void initState() {
    super.initState();
    when((_) => matriculaStore.matriculaSaved, () {
      GetIt.I<PageStore>().setPage(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(
        fontWeight: FontWeight.w800, color: Colors.grey, fontSize: 18);

    const cPadding = EdgeInsets.fromLTRB(16, 8, 12, 8);

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Matrícula'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 8,
            child: Observer(builder: (context) {
              if (matriculaStore.isLoading)
                return Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "Salvando matrícula...",
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                              Theme.of(context).primaryColor)),
                    ],
                  ),
                );
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ImagesField(matriculaStore),
                  Observer(builder: (_) {
                    return TextFormField(
                      onChanged: matriculaStore.setNome,
                      decoration: InputDecoration(
                          errorText: matriculaStore.nomeError,
                          prefix: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          labelText: "Nome *",
                          labelStyle: labelStyle,
                          contentPadding: cPadding),
                    );
                  }),

                  TurmaField(matriculaStore),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  CEPField(matriculaStore),

                  Observer(builder: (_) {
                    return TextFormField(
                      onChanged: matriculaStore.setPhone,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter()
                      ],
                      decoration: InputDecoration(
                          errorText: matriculaStore.phoneError,
                          labelText: "Celular *",
                          labelStyle: labelStyle,
                          contentPadding: cPadding),
                    );
                  }),
                  Observer(builder: (_) {
                    return TextFormField(
                      onChanged: matriculaStore.setEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          errorText: matriculaStore.emailError,
                          labelText: "E-mail *",
                          labelStyle: labelStyle,
                          contentPadding: cPadding),
                    );
                  }),
                  HideField(matriculaStore),
                  Observer(builder: (_) {
                    return ErrorBox(matriculaStore.error);
                  }),
                  Observer(builder: (_) {
                    return GestureDetector(
                      onTap: matriculaStore.invalidSendPressed,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStatePropertyAll(0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                          onPressed: matriculaStore.sendPressed,
                          child: Text("Enviar")),
                    );
                  })
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
