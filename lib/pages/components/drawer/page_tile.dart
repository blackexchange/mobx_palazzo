import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  late final String label;
  late final IconData iconData;
  late final VoidCallback onTap;
  late bool highlighted;

  PageTile(
      {required this.label,
      required this.iconData,
      required this.onTap,
      required this.highlighted});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: highlighted
            ? Theme.of(context).primaryColorDark
            : Theme.of(context).primaryColor,
      ),
      title: Text(label),
      onTap: onTap,
    );
  }
}
