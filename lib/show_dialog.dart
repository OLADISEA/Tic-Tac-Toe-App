import 'package:flutter/material.dart';


class DisplayDialog extends StatelessWidget {
  final title;
  final content;
  VoidCallback callback;
  final actionText;

  DisplayDialog({required this.title, this.content = 'Press Continue to keep playing',
    this.actionText = 'Continue',required this.callback,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        ElevatedButton(
            onPressed: callback,
            child: Text(actionText)
        )
      ],
    );
  }
}

