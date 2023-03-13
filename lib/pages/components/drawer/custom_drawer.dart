import 'package:flutter/material.dart';

import './page_section.dart';
import 'custom_header.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(88)),
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.65,
        child: ListView(
          children: [CustomHeader(), PageSection()],
        ),
      ),
    );
  }
}
