import 'package:chronos/const.dart';
import 'package:chronos/pages/home_page.dart';
import 'package:flutter/material.dart';

Widget loginButton(
    {required BuildContext context,
    Widget? icon,
    required Function() onPressed}) {
  return Container(
    height: 60,
    width: 320,
    decoration: BoxDecoration(
        color: Colors.tealAccent[400], borderRadius: BorderRadius.circular(20)),
    child: TextButton(
      onPressed: onPressed,
      child: icon != null
          ? Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Login using ",
                    style: titleStyleBlack,
                  ),
                ),
                Expanded(flex: 1, child: icon),
              ],
            )
          : const Text(
              'Login',
              style: titleStyleBlack,
            ),
    ),
  );
}
