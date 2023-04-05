import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../stores/stores.dart';
import '../../pages.dart';

class CustomHeader extends StatelessWidget {
  final AuthStore auth = GetIt.I<AuthStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if (auth.isAuth) {
          GetIt.I<PageStore>().setPage(0);
        } else {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => LoginPage()));
        }
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
              children: [
                Text(
                  auth.isAuth
                      ? auth.userAuth!.name!
                      : 'Acesse sua conta agora!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  auth.isAuth ? auth.userAuth!.email! : 'Clique aqui!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
