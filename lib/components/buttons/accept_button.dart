import 'package:flutter/material.dart';

class AcceptButton extends StatelessWidget {
  AcceptButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: const BorderSide(color: Colors.green)),
        child: const Text(
          "Accept",
          style: TextStyle(
            fontSize: 20,
            color: Colors.green,
          ),
        ));
  }
}
