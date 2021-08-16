import 'package:flutter/material.dart';

void mostrarSnackBar({ required BuildContext context, required String mensaje}){
  SnackBar snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.red,
    content: Text(mensaje),
    duration: Duration(seconds: 2),

  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);  
}