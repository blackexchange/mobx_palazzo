import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageSourceModal extends StatelessWidget {
  final Function(File?) onImageSelected;
  ImageSourceModal(this.onImageSelected);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid)
      return BottomSheet(
        onClosing: () {},
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OutlinedButton.icon(
                onPressed: getFromCamera,
                icon: Icon(Icons.camera_alt),
                label: Text("Câmera")),
            OutlinedButton.icon(
                onPressed: getFromGallery,
                icon: Icon(Icons.image),
                label: Text("Galeria"))
          ],
        ),
      );
    else
      return CupertinoActionSheet(
        title: Text('Selecione foto'),
        message: Text('Escolha a origem da foto'),
        cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar')),
        actions: [
          CupertinoActionSheetAction(
              onPressed: getFromCamera, child: Text('Câmera')),
          CupertinoActionSheetAction(
              onPressed: getFromGallery, child: Text('Galeria'))
        ],
      );
  }

  Future<void> getFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile == null) return;
    imageSelected(pickedFile);
  }

  Future<void> getFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    imageSelected(pickedFile);
  }

  Future<void> imageSelected(XFile? image) async {
    final imgCrop = await ImageCropper.platform.cropImage(
        sourcePath: image!.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Editar Imagem',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
          ),
          IOSUiSettings(
              title: 'Editar Imagem',
              cancelButtonTitle: 'Cancelar',
              doneButtonTitle: 'Concluir'),
        ]);
    if (imgCrop != null) onImageSelected(File(imgCrop.path));
  }
}
