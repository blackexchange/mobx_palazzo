import 'package:flutter/material.dart';

import 'package:mobx_palazzo/pages/user/user_matricula.dart';
import '../../../models/models.dart';

class UserTile extends StatelessWidget {
  final User m;

  UserTile(this.m);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          title: Text(
            m.name!,
            style: TextStyle(fontSize: 14),
          ),
          subtitle: Text(m.email!),
          // leading: Text(m.status.index.toString()),

          trailing: 1 == 1
              ? Icon(
                  Icons.online_prediction,
                  color: Colors.green,
                )
              : Icon(
                  Icons.pending,
                  color: Colors.yellow,
                ),
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserMatricula(m)),
            );
          },
        ),
      ),
    );
  }
}
