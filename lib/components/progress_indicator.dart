import 'package:flutter/material.dart';

Future<dynamic> showProgressIndicator(BuildContext context) {
  // AppCubit appCubit = AppCubit.get(context);
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Center(
        child: SizedBox(
            width: 100, height: 100, child: CircularProgressIndicator()),
      );
    },
  );
}
