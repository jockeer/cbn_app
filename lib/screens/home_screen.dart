import 'dart:ui';

import 'package:cbn/utils/preferencias_usuario.dart';
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

    return Column(
      children: [
        SizedBox(height: 10,),
        _Perfil(),
        SizedBox(height: 10,),
        Row(
          children: [
            Expanded(child: _MenuItem(titulo: 'Beneficios', ruta: 'cupon_gifcard', img:'beneficios.jpg', icon: 'inbo.png',)),
            Expanded(child: _MenuItem(titulo: 'Calculadora (IVA)', ruta: 'cupon_gifcard', img:'iva.jpg', icon: 'calculadora.png',)),
          ],
        ),
        Row(
          children: [
            Expanded(child: _MenuItem(titulo: 'Informa', ruta: 'informa', img:'informa.jpg', icon: 'megafono.png',)),
            Expanded(child: _MenuItem(titulo: 'Gestión institucional', ruta: 'cupon_gifcard', img:'gestion.jpg', icon: 'gestion.png',)),
          ],
        ),
        Row(
          children: [
            Expanded(child: _MenuItem(titulo: 'InBox', ruta: 'cupon_gifcard', img:'inbox.jpg', icon: 'inbo.png',)),
            Expanded(child: _MenuItem(titulo: 'Glosario', ruta: 'perfil', img:'glosario.jpg', icon: 'lupa.png',)),
          ],
        ),
      ],
    );
  }
}

class _Perfil extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){Navigator.pushNamed(context, 'perfil');},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: size.width,
          height: size.width*0.40,
          child: Row(
            children: [
              Container(
                width: size.width*0.35,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(image: AssetImage('assets/fondos/Group 21.png'), fit: BoxFit.cover)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Maricarmen Jessica Rojas Cabrera', style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),  ),
                      Text('Legajo: 93023409', style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),  ),
                      Text('Interno: 55720', style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),  ),
                      Text('C.I.: 7654321', style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),  ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/icons/girl.jpg'), fit: BoxFit.cover)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset('assets/icons/user.png', width: 35),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {

  final String titulo, ruta, img, icon;

  final prefs = PreferenciasUsuario();
  
  _MenuItem({required this.titulo,required this.ruta, required this.img, required this.icon});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, this.ruta);
            },
            child: Container(
              alignment: Alignment.bottomLeft,
                margin: EdgeInsets.symmetric( vertical: 10, horizontal: 6),
                height: size.width * 0.45,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/img/$img'), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Container(
                  height: size.width*0.1,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
                  ),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(this.titulo,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white), maxLines: 2,),
                      Image(image: AssetImage('assets/icons/$icon'), width: size.width*0.06,)
                    ],
                  ) 
                  
                ),
            ),
          ),
        ),
        (this.titulo == 'InBox') 
        ? (this.prefs.inbox != 0)
          ? Positioned(
              top: 0,
              right: 2,
              child: Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red
                ),
                child: Text(this.prefs.inbox.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: size.width * 0.05 ),),
              )
            )
          :Container()
        :Container(),
      ],
    );
  }
}