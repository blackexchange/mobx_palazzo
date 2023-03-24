import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';

import '../../components/drawer/page_tile.dart';
import '../../../stores/page_store.dart';

class PageSection extends StatelessWidget {
  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
            label: 'Home',
            iconData: Icons.home,
            onTap: () {
              pageStore.setPage(0);
            },
            highlighted: pageStore.page == 0),
        PageTile(
            label: 'Matrículas',
            iconData: Icons.child_care,
            onTap: () {
              pageStore.setPage(1);
            },
            highlighted: pageStore.page == 1),
        PageTile(
            label: 'Ocorrências',
            iconData: Icons.book,
            onTap: () {
              pageStore.setPage(2);
            },
            highlighted: pageStore.page == 2),
      ],
    );
  }
}
