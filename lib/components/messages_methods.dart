import 'package:flutter/material.dart';

showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

showSnackBarWidget(Widget widget, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      content: widget,
    ),
  );
}

showDialogMessage(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text("Ok")),
      ],
    ),
  );
}
