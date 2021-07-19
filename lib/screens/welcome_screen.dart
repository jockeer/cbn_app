import 'package:cbn/utils/constantes.dart';
import 'package:flutter/material.dart';

import 'package:cbn/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _Carousel(),
          _Buttons()

        ],
      )
    );
  }
}

class _Carousel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
        height: size.height,
        viewportFraction: 1,
        enableInfiniteScroll: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal
      ),
      items: [
        FondoPantalla(),
        Center(child: Text('2', style: TextStyle(color: Colors.black),),),
        Center(child: Text('3', style: TextStyle(color: Colors.black),),),
      ],
    );
  }
}

class _Buttons extends StatelessWidget {

  final estilos = EstilosApp();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        children: [
          SizedBox(width: 10,),
          Expanded(child: ElevatedButton(onPressed: (){ Navigator.pushNamed(context, 'login'); }, child: estilos.buttonChild(texto: 'Ingresa'), style: estilos.buttonStyle(),)),
          Expanded(child: ElevatedButton(onPressed: (){ Navigator.pushNamed(context, 'register_page1'); }, child: estilos.buttonChild(texto: 'Regístrate'), style: estilos.buttonStyle(),)),
          SizedBox(width: 10,),
        ],
      ),
    );
  }
}