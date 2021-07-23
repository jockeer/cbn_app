import 'package:flutter/material.dart';

PreferredSizeWidget appBarWidget({ required String titulo, bool centrado = false , Color bgColor = Colors.black, Color textColor = Colors.white}) {
  return AppBar(
      centerTitle: centrado,
      title: Text(titulo, style: TextStyle(color: textColor),), 
      backgroundColor: bgColor, 
      iconTheme: IconThemeData(color: textColor),
    );
}

