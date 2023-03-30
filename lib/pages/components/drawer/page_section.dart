import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_palazzo/pages/pages.dart';
import 'package:mobx_palazzo/stores/stores.dart';

import '../../components/drawer/page_tile.dart';
import '../../../stores/page_store.dart';

class PageSection extends StatelessWidget {
  final PageStore pageStore = GetIt.I<PageStore>();
  final AuthStore authStore = GetIt.I<AuthStore>();

  @override
  Widget build(BuildContext context) {
    Future<void> verifyLogin(int page) async {
      if (authStore.isAuth) {
        pageStore.setPage(page);
      } else {
        final resLogin = await Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => LoginPage()));
        if (resLogin != null && resLogin) {
          pageStore.setPage(page);
        }
      }
    }

    return Column(
      children: [
        PageTile(
            label: 'Home',
            iconData: Icons.home,
            onTap: () {
              verifyLogin(0);
            },
            highlighted: pageStore.page == 0),
        PageTile(
            label: 'Matrículas',
            iconData: Icons.child_care,
            onTap: () {
              verifyLogin(1);
            },
            highlighted: pageStore.page == 1),
        PageTile(
            label: 'Usuários',
            iconData: Icons.supervised_user_circle_sharp,
            onTap: () {
              verifyLogin(2);
              ;
            },
            highlighted: pageStore.page == 2),
        PageTile(
            label: 'Fila',
            iconData: Icons.linear_scale_sharp,
            onTap: () {
              verifyLogin(3);
            },
            highlighted: pageStore.page == 3),
        PageTile(
            label: 'Fila2',
            iconData: Icons.linear_scale_sharp,
            onTap: () {
              pageStore.setPage(4);
            },
            highlighted: pageStore.page == 4),
        PageTile(
            label: 'Minha Conta',
            iconData: Icons.linear_scale_sharp,
            onTap: () {
              verifyLogin(5);
            },
            highlighted: pageStore.page == 5),
      ],
    );
  }
}
