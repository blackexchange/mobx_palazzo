import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final dynamic image;
  final VoidCallback onDelete;

  ImageDialog({required this.image, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.file(image),
          OutlinedButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
                onDelete();
              },
              icon: Icon(Icons.delete),
              label: Text("Excluir"))
        ],
      ),
    );
  }
}
