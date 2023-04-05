import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../stores/stores.dart';
import 'components.dart';

class ImagesField extends StatelessWidget {
  final MatriculaStore matriculaStore;

  ImagesField(this.matriculaStore);

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File? image) {
      matriculaStore.images.add(image);
      Navigator.of(context).pop();
    }

    return Column(
      children: [
        Container(
          color: Colors.grey[200],
          height: 120,
          child: Observer(builder: (_) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: matriculaStore.images.length < 5
                    ? matriculaStore.images.length + 1
                    : 5,
                itemBuilder: (_, index) {
                  if (index == matriculaStore.images.length)
                    return Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, index == 4 ? 8 : 0, 8),
                      child: GestureDetector(
                        onTap: () {
                          if (Platform.isAndroid) {
                            showModalBottomSheet(
                                context: context,
                                builder: (_) =>
                                    ImageSourceModal(onImageSelected));
                          } else {
                            showCupertinoDialog(
                                context: context,
                                builder: (_) =>
                                    ImageSourceModal(onImageSelected));
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
                                  image: matriculaStore.images[index],
                                  onDelete: () =>
                                      matriculaStore.images.removeAt(index)));
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: 44,
                          backgroundImage:
                              FileImage(matriculaStore.images[index]),
                        ),
                      ),
                    );
                });
          }),
        ),
        Observer(builder: (_) {
          if (matriculaStore.imagesError != null) {
            return Container(
              padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.red))),
              child: Text(
                matriculaStore.imagesError!,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            );
          } else {
            return Container();
          }
        })
      ],
    );
  }
}
