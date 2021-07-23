import 'package:flutter/material.dart';

class FondoPantalla extends StatelessWidget {

  final String img;

  FondoPantalla({ required this.img });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Image(
      image: AssetImage('assets/fondos/$img'),
      fit: BoxFit.cover,
      width: size.width,
      height: size.height,
    );
  }
}