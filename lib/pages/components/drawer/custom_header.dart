import 'package:flutter/material.dart';

import '../../pages.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => LoginPage()));
      },
      child: Container(
        color: Theme.of(context).primaryColor,
        height: 88,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(children: [
          Icon(
            Icons.person,
            color: Colors.white,
            size: 36,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('Olá'), Text('Acesse')],
            ),
          )
        ]),
      ),
    );
  }
}
