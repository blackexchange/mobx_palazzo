import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../stores/stores.dart';

class EditAccountPage extends StatelessWidget {
  final AccountStore accountStore = AccountStore();

  EditAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Conta"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: EdgeInsets.symmetric(horizontal: 32),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /* IgnorePointer(
                  ignoring: accountStore.loading,
                  child: LayoutBuilder(builder: (_, constraint) {
                    return ToggleSwitch(
                        minWidth: constraint.biggest.width / 2.01,
                        labels: ['Responsável', 'Funcionário'],
                        cornerRadius: 20,
                        activeBgColor: [Theme.of(context).primaryColorLight],
                        inactiveBgColor: Colors.grey,
                        activeFgColor: Colors.white,
                        inactiveFgColor: Colors.white,
                        initialLabelIndex: accountStore.userType?.index,
                        onToggle: accountStore.setUserType);
                  }),
                ),*/
                SizedBox(
                  height: 16,
                ),
                Observer(builder: (_) {
                  return TextFormField(
                    initialValue: accountStore.name,
                    onChanged: accountStore.setName,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Nome *'),
                  );
                }),
                SizedBox(
                  height: 8,
                ),
                Observer(builder: (_) {
                  return TextFormField(
                    initialValue: accountStore.phone,
                    onChanged: accountStore.setPhone,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Telefone *'),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter()
                    ],
                    keyboardType: TextInputType.phone,
                  );
                }),
                SizedBox(
                  height: 8,
                ),
                Observer(builder: (_) {
                  return TextFormField(
                    onChanged: accountStore.setPass1,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Nova Senha'),
                    obscureText: true,
                  );
                }),
                SizedBox(
                  height: 8,
                ),
                Observer(builder: (_) {
                  return TextFormField(
                    onChanged: accountStore.setPass2,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Confirmar Nova Senha'),
                    obscureText: true,
                  );
                }),
                SizedBox(
                  height: 32,
                ),
                Observer(builder: (_) {
                  return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColorLight),
                        // padding: MaterialStateProperty.all(EdgeInsets.all(50)),
                        //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
                      ),
                      onPressed: accountStore.send,
                      child: accountStore.loading
                          ? CircularProgressIndicator()
                          : Text("Salvar"));
                }),
                SizedBox(
                  height: 4,
                ),
                ElevatedButton(
                  onPressed: () {
                    accountStore.logout();
                    GetIt.I<PageStore>().setPage(0);
                    Navigator.of(context).pop();
                  },
                  child: Text("Sair"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColorLight),
                    // padding: MaterialStateProperty.all(EdgeInsets.all(50)),
                    //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
