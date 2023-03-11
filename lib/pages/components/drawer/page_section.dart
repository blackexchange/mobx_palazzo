import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobx_palazzo/pages/components/drawer/page_tile.dart';

class PageSection extends StatelessWidget {
  const PageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Reservas',
          iconData: Icons.cake,
          onTap: () {},
          highlighted: false,
        ),
      ],
    );
  }
}
