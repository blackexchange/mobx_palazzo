import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../stores/stores.dart';
import 'components.dart';

class ImagesField extends StatelessWidget {
  final AlunoStore alunoStore;

  ImagesField(this.alunoStore);

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File? image) {
      alunoStore.images.add(image);
      Navigator.of(context).pop();
    }

    return Container(
      color: Colors.grey[200],
      height: 120,
      child: Observer(builder: (_) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                alunoStore.images.length < 5 ? alunoStore.images.length + 1 : 5,
            itemBuilder: (_, index) {
              if (index == alunoStore.images.length)
                return Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, index == 4 ? 8 : 0, 8),
                  child: GestureDetector(
                    onTap: () {
                      if (Platform.isAndroid) {
                        showModalBottomSheet(
                            context: context,
                            builder: (_) => ImageSourceModal(onImageSelected));
                      } else {
                        showCupertinoDialog(
                            context: context,
                            builder: (_) => ImageSourceModal(onImageSelected));
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: 44,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 40,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              else
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => ImageDialog(
                              image: alunoStore.images[index],
                              onDelete: () =>
                                  alunoStore.images.removeAt(index)));
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: 44,
                      backgroundImage: FileImage(alunoStore.images[index]),
                    ),
                  ),
                );
            });
      }),
    );
  }
}
