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
            Expanded(child: _MenuItem(titulo: 'Beneficios', ruta: 'cupon_gifcard', icon: 'beneficios.png',)),
            Expanded(child: _MenuItem(titulo: 'Calculadora (IVA)', ruta: 'calculadora', icon: 'calculadora.png',)),
          ],
        ),
        Row(
          children: [
            Expanded(child: _MenuItem(titulo: 'Informa', ruta: 'informa',  icon: 'megafono.png',)),
            Expanded(child: _MenuItem(titulo: 'Gestión institucional', ruta: 'cupon_gifcard', icon: 'gestion.png',)),
          ],
        ),
        Row(
          children: [
            Expanded(child: _MenuItem(titulo: 'InBox', ruta: 'cupon_gifcard',  icon: 'inbo.png',)),
            Expanded(child: _MenuItem(titulo: 'Glosario', ruta: 'glosario', icon: 'glosario.png',)),
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
          child: Row(
            children: [
              Container(
                width: size.width*0.30,
                height: size.width*0.35,
                color: Colors.black,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image(image: AssetImage('assets/icons/bolivia.png'),),
                      Text('Tu ubicacion', style: TextStyle(color: Colors.white, fontSize: 12),)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: size.width*0.35,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/fondos/biconos.png'), fit: BoxFit.cover)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('assets/icons/user.png'), height: size.width*0.20,),
                      SizedBox(height: 5,),
                      Text('Perfil', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)
                    ],
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

  final String titulo, ruta, icon;

  final prefs = PreferenciasUsuario();
  
  _MenuItem({required this.titulo,required this.ruta, required this.icon});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 0),
          child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, this.ruta);
            },
            child: Container(
                margin: EdgeInsets.symmetric( vertical: 10, horizontal: 6),
                height: size.width * 0.45,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/fondos/biconos.png'), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Container(
                  height: size.width * 0.45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('assets/icons/$icon'), width: size.width*0.2,),
                      SizedBox(height: 15,),
                      Text(this.titulo,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white), maxLines: 2,),
                    ],
                  ),
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
          : Container()
        : Container(),
      ],
    );
  }
}