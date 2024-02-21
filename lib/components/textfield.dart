import 'package:chronos/const.dart';
import 'package:flutter/material.dart';

TextField getTextField(
    {required String title,
    bool? isHidden,
    IconData? icon,
    TextEditingController? controller,
    TextInputType? inputType,
    required Function(String) onChanged}) {
  return TextField(
    obscureText: isHidden ?? false,
    style: const TextStyle(color: Colors.white),
    controller: controller,
    decoration: InputDecoration(
      suffixIcon: Icon(
        icon,
        color: Colors.white,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      hintStyle: subTitleStyle,
      hintText: title,
      fillColor: Colors.transparent,
    ),
    keyboardType: inputType,
    onChanged: onChanged,
  );
}
