import 'package:chronos/const.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  AddButton({Key? key, required this.onPressed}) : super(key: key);
  Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.teal, borderRadius: BorderRadius.circular(20)),
      child: OutlinedButton(
        onPressed: onPressed,
        child: const Text(
          "ADD",
          style: subTitleStyle,
        ),
        style: OutlinedButton.styleFrom(
            elevation: 0,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent),
      ),
    );
  }
}
