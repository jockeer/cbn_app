import 'package:flutter/material.dart';

import 'package:cbn/utils/constantes.dart';

class DetailCuentaScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            _Cabecera(),
            SizedBox(height: 20,),
            _FotoPerfil(),
            SizedBox(height: 20,),
            _Info()
          ],
        ),
      ),
    );
  }
}

class _Cabecera extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height*0.23,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/fondos/fondoHeader.png'),fit: BoxFit.cover)
      ),
      child: Stack(
        children: [
          Positioned(top: 0,left: 0,child: IconButton(icon: Icon(Icons.person),iconSize: size.width*0.10,color: Colors.white, onPressed: (){},)),
          Positioned(bottom: 0,left: 0,child: IconButton(icon: Icon(Icons.notifications),iconSize: size.width*0.10,color: Colors.red, onPressed: (){},)),
          Positioned(right: 0,bottom: 0,child: IconButton(icon: Icon(Icons.chat_rounded),iconSize: size.width*0.10,color: Color(0xffF2BA49), onPressed: (){},)),

        ],
      )
    );
  }
}
class _FotoPerfil extends StatelessWidget {

  final colores = ColoresApp();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          width: size.width*0.35,
          height: size.width*0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: colores.plomo, width: 6.0)

          ),
          child: Icon(Icons.person,size: size.width*0.15, color: Colors.black,),
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(),
        Row(),
        Row(),
        Row(),
      ],
    );
  }
}
