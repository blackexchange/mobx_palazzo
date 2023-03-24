import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import '../pages.dart';

class AlunosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(
        fontWeight: FontWeight.w800, color: Colors.grey, fontSize: 18);

    const cPadding = EdgeInsets.fromLTRB(16, 8, 12, 8);

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true,
      ),
      body: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(
                  prefix: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  labelText: "Nome*",
                  labelStyle: labelStyle,
                  contentPadding: cPadding),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Endereço",
                  labelStyle: labelStyle,
                  contentPadding: cPadding),
              maxLines: null,
            ),
          ],
        ),
      ),
    );
  }
}
