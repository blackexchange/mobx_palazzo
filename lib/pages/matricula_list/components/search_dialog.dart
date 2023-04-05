import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  final TextEditingController controller;
  final String currentSearch;
  SearchDialog({required this.currentSearch})
      : controller = TextEditingController(text: currentSearch);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2,
          left: 2,
          right: 2,
          child: Card(
              child: TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
              hintText: 'Digite aqui',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.8),
              ),
              prefixIcon: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: Navigator.of(context).pop,
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: controller.clear,
              ),
            ),
            textInputAction: TextInputAction.search,
            onSubmitted: (text) {
              Navigator.of(context).pop(text);
            },
            autofocus: true,
          )),
        )
      ],
    );
  }
}
