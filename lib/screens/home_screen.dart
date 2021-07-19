import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: _Menu(),
          ),
        ),
      )
    );
  }
}

class _Menu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _MenuItem(titulo: 'Glosario', ruta: 'ruta')),
            SizedBox(width: 10,),
            Expanded(child: _MenuItem(titulo: 'Calculadora (IVA)', ruta: 'ruta')),
          ],
        ),
        SizedBox(height: 15,),
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            children: [
              Container(
              height: size.width*0.4,
              color: Colors.black,
              ),
              Positioned(
                top: 10,
                left: 20,
                right: 20,
                child: Text('Cupones y Gift Cards', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)
              )
            ],
          ),
        ),
        SizedBox(height: 15,),
        Row(
          children: [
            Expanded(child: _MenuItem(titulo: 'Informa', ruta: 'ruta')),
            SizedBox(width: 10,),
            Expanded(child: _MenuItem(titulo: 'Gestión institucional', ruta: 'ruta')),
          ],
        ),
        SizedBox(height: 15,),
        Row(
          children: [
            Expanded(child: _MenuItem(titulo: 'InBox', ruta: 'ruta')),
            SizedBox(width: 10,),
            Expanded(child: _MenuItem(titulo: 'Visualizador (IVA)', ruta: 'ruta')),
          ],
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {

  final String titulo, ruta;
  
  _MenuItem({required this.titulo,required this.ruta});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        children: [
          Container(
          height: size.width*0.5,
          color: Colors.black,
          ),
          Positioned(
            top: 10,
            left: 20,
            right: 20,
            child: Text(this.titulo, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)
          )
        ],
      ),
    );
  }
}