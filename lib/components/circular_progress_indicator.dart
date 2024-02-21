import 'package:flutter/material.dart';

Widget getProgressIndicator() {
  return const Center(
    child: SizedBox(
      width: 100,
      height: 100,
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    ),
  );
}
