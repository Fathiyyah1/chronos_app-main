import 'package:flutter/material.dart';

class DeclineButton extends StatelessWidget {
  DeclineButton({
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
            side: const BorderSide(color: Colors.red)),
        child: const Text(
          "Decline",
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ));
  }
}
