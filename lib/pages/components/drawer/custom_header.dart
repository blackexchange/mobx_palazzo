import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
