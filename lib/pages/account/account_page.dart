import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'account.dart';
import '../../pages/components/components.dart';
import '../../stores/auth_store.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Conta'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Center(
          child: Card(
        margin: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 140,
              child: Stack(children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Observer(builder: (_) {
                            return Text(
                              GetIt.I<AuthStore>().userAuth!.name!,
                              style: TextStyle(
                                  //    color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            );
                          }),
                          Text(
                            GetIt.I<AuthStore>().userAuth!.email!,
                            style: TextStyle(
                                //   color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => EditAccountPage()));
                          },
                          child: Text("EDITAR")),
                    )
                  ],
                ),
              ]),
            ),
            Divider(),
            ListTile(
              title: Text("Minhas Crianças"),
              trailing: Icon(
                Icons.keyboard_arrow_right,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Container()));
              },
            ),
            ListTile(
              title: Text("Relatório de Filas"),
              trailing: Icon(
                Icons.keyboard_arrow_right,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => MyFilaScreen()));
              },
            )
          ],
        ),
      )),
    );
  }
}
