import 'package:flutter/material.dart';

class CustomDialog {
  static showCustomDialog({
    @required BuildContext parentContext,
    @required String title,
    Widget content,
  }) {
    showDialog<String>(
      context: parentContext,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: content ?? Text('Аягына жеттик!'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }
}
