import 'package:flutter/material.dart';

import '../components/components.dart';
import './components/components.dart';

class HomePage extends StatelessWidget {
  openSearch(BuildContext context) async {
    final search =
        await showDialog(context: context, builder: (_) => SearchDialog());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  openSearch(context);
                },
                icon: Icon(Icons.search))
          ],
        ),
      ),
    );
  }
}
