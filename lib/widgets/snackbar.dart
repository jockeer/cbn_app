import 'package:flutter/material.dart';

void mostrarSnackBar(BuildContext context, String mensaje){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(mensaje),
  ));
}