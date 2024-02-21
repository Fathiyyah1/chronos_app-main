import 'package:chronos/const.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  LogoutButton({
    Key? key,
    required this.onPressed,
    this.elevation,
  }) : super(key: key);
  Function() onPressed;
  bool? elevation;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        style: OutlinedButton.styleFrom(
            elevation: (elevation != null) ? 10 : 0,
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Text(
          "Logout",
          style: subTitleStyle,
        ));
  }
}
