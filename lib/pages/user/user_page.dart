import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../stores/stores.dart';

import '../components/components.dart';
import './components/components.dart';

class UserPage extends StatelessWidget {
  final UserStore userStore = GetIt.I<UserStore>();

  openSearch(BuildContext context) async {
    final search = await showDialog(
        context: context,
        builder: (_) => SearchDialog(currentSearch: userStore.search));

    if (search != null) {
      userStore.setSearch(search);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Observer(builder: (_) {
            return userStore.search.isNotEmpty
                ? GestureDetector(
                    child: LayoutBuilder(builder: (_, constraints) {
                      return Container(
                          width: constraints.biggest.width,
                          child: Text(userStore.search));
                    }),
                    onTap: () {
                      openSearch(context);
                    },
                  )
                : Container();
          }),
          actions: [
            Observer(builder: (context) {
              if (userStore.search.isEmpty) {
                return IconButton(
                    onPressed: () {
                      openSearch(context);
                    },
                    icon: const Icon(Icons.search));
              }
              return IconButton(
                  onPressed: () {
                    userStore.setSearch('');
                  },
                  icon: const Icon(Icons.clear));
            })
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Observer(builder: (_) {
              if (userStore.error != null) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        Icons.error,
                        size: 100,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Ocorreu um erro',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              }
              if (userStore.loading) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                );
              }
              if (userStore.userList.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        Icons.border_clear,
                        size: 100,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Humm... Não há registros!',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              }
              return ListView.builder(
                  itemCount: userStore.userList.length,
                  itemBuilder: (_, i) {
                    return UserTile(userStore.userList[i]);
                  });
            })),
          ],
        ),
      ),
    );
  }
}
