import 'package:cbn/utils/constantes.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final colores = ColoresApp();
  final String titulo,logo;
  Header({ required this.titulo, required this.logo });
  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
    return Container(
      height: size.width*0.15,
      width: size.width,
      decoration: BoxDecoration(
        color: colores.naranja,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(40))
      ),
      child: Stack(
        children: [
          Positioned( top: 0, bottom: 0, left: 40, child: Image(image: AssetImage('assets/icons/$logo'), height: size.width*0.10, width: size.width*0.10,)),
          Center(child: Text(this.titulo, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16 ),))
        ],
      ),
    );
  }
}