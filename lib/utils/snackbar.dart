import 'package:flutter/material.dart';

void mostrarSnackBar(
    {required BuildContext context,
    required String mensaje,
    Color color = Colors.red}) {
  SnackBar snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: color,
    content: Text(mensaje),
    duration: Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
