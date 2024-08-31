import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 1000),
      content: Text(
        content,
        style: const TextStyle(color: Colors.black, fontSize: 20),
      )));
}
