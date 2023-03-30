import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../stores/stores.dart';

import '../components/components.dart';
import './components/components.dart';

class HomePage extends StatelessWidget {
  final HomeStore homeStore = GetIt.I<HomeStore>();

  openSearch(BuildContext context) async {
    final search = await showDialog(
        context: context,
        builder: (_) => SearchDialog(currentSearch: homeStore.search));

    if (search != null) {
      homeStore.setSearch(search);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Observer(builder: (_) {
            return homeStore.search.isNotEmpty
                ? GestureDetector(
                    child: LayoutBuilder(builder: (_, constraints) {
                      return Container(
                          width: constraints.biggest.width,
                          child: Text(homeStore.search));
                    }),
                    onTap: () {
                      openSearch(context);
                    },
                  )
                : Container();
          }),
          actions: [
            Observer(builder: (context) {
              if (homeStore.search.isEmpty) {
                return IconButton(
                    onPressed: () {
                      openSearch(context);
                    },
                    icon: const Icon(Icons.search));
              }
              return IconButton(
                  onPressed: () {
                    homeStore.setSearch('');
                  },
                  icon: const Icon(Icons.clear));
            })
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Observer(builder: (_) {
              if (homeStore.error != null) {
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
                        '',
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
              if (homeStore.loading) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                );
              }
              if (homeStore.matriculaList.isEmpty) {
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
                  itemCount: homeStore.matriculaList.length,
                  itemBuilder: (_, i) {
                    return MatriculaTile(homeStore.matriculaList[i]);
                  });
            })),
          ],
        ),
      ),
    );
  }
}
