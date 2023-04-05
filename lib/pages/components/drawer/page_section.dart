import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../models/models.dart';

import '../../../pages/pages.dart';
import '../../../stores/stores.dart';

import '../../components/drawer/page_tile.dart';

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
        if (authStore.userAuth?.type == UserType.ADMIN ||
            authStore.userAuth?.type == UserType.ESCOLA)
          PageTile(
              label: 'Matrículas',
              iconData: Icons.edit_document,
              onTap: () {
                verifyLogin(1);
              },
              highlighted: pageStore.page == 1),
        if (authStore.userAuth?.type == UserType.ADMIN ||
            authStore.userAuth?.type == UserType.ESCOLA)
          PageTile(
              label: 'Usuários',
              iconData: Icons.supervised_user_circle_sharp,
              onTap: () {
                verifyLogin(2);
              },
              highlighted: pageStore.page == 2),
        PageTile(
            label: 'Buscar Criança',
            iconData: Icons.child_care_sharp,
            onTap: () {
              verifyLogin(3);
            },
            highlighted: pageStore.page == 3),
        if (authStore.userAuth?.type == UserType.ADMIN ||
            authStore.userAuth?.type == UserType.ESCOLA)
          PageTile(
              label: 'Posição na Fila',
              iconData: Icons.car_crash,
              onTap: () {
                pageStore.setPage(4);
              },
              highlighted: pageStore.page == 4),
        PageTile(
            label: 'Minha Conta',
            iconData: Icons.person,
            onTap: () {
              verifyLogin(5);
            },
            highlighted: pageStore.page == 5),
      ],
    );
  }
}
