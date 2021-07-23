import 'package:carousel_slider/carousel_slider.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CuponesScreen extends StatelessWidget {
  final estilos = EstilosApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(titulo: 'Cupones'),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Cupon de prueba'),
              SizedBox(width: 5,),
              ElevatedButton(
                style: estilos.buttonStyle(oscuro: true),
                child: Text('Restablecer'),
                onPressed: (){}, 
              )
            ],
          ),
          SizedBox(height: 20,),
          Center(child: Text('Descuentos del 20%', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)),
          SizedBox(height: 10,),
          
          _Carousel(),
          SizedBox(height: 20,),
          _BotonCanjear(),
          SizedBox(height: 20,),
          Center(child: Text('Valido hasta agotar Stock')),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}

class _BotonCanjear extends StatelessWidget {

  final estilos = EstilosApp();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: estilos.buttonChild(texto: 'Canjear'),
        style: estilos.buttonStyle(oscuro: true),
        onPressed: (){}, 
      ),
    );
  }
}

class _Carousel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.57,
      color: Colors.grey[350],
      child: CarouselSlider(
        options: CarouselOptions(
          height: size.height*0.55,
          viewportFraction: 1,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
          enlargeCenterPage: true

        ),
        items: [
          Container(
            width: double.infinity,
            color: Colors.red,

          ),
          Container(
            width: double.infinity,
            color: Colors.blue,

          ),
          Container(
            width: double.infinity,
            color: Colors.green,

          ),
        ],
      ),
    );
  }
}