import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  final String? message;

  ErrorBox(this.message);

  @override
  Widget build(BuildContext context) {
    if (message == null) return Container();
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Colors.redAccent,
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 32,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
              child: Text(
            'Oops! $message. Tente novamente.',
            style: TextStyle(color: Colors.white),
          ))
        ],
      ),
    );
  }
}
