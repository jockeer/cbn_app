import 'package:cbn/providers/login_provider.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuInferior extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10,
          child: Row(
            children: [
              Expanded(child: Container(color: Color(0xff0D110E),)),
              Expanded(child: Container(color: Color(0xff44413D),)),
              Expanded(child: Container(color: Color(0xff737679),)),
              Expanded(child: Container(color: Colors.white,)),
            ],
          ),
        ),
        Container(
          height: 70,
          color: Colors.black,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: 20,),
              _MenuItem(img: 'user.png', texto: 'Perfil', index: 0),
              SizedBox(width: 40,),
              _MenuItem(img: 'glosario.png', texto: 'Glosario', index: 1),
              SizedBox(width: 40,),
              _MenuItem(img: 'beneficios.png', texto: 'Beneficios', index: 2),
              SizedBox(width: 40,),
              _MenuItem(img: 'megafono.png', texto: 'CBN', index: 3),
              SizedBox(width: 40,),
              _MenuItem(img: 'gestion.png', texto: 'Gestion I.', index: 4),
              SizedBox(width: 40,),
              _MenuItem(img: 'inbo.png', texto: 'Inbox', index: 5),
              SizedBox(width: 40,),
              _MenuItem(img: 'calculadora.png', texto: 'IVA', index: 6),
              
              SizedBox(width: 20,),
            ],
          ),
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String img,texto;
  final int index;
  final colores = ColoresApp();

  _MenuItem({ required this.img, required this.texto, required this.index });
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return GestureDetector(
      onTap: (){
        provider.index = this.index;
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/icons/$img'), width: 25,),
          SizedBox(height: 5,),
          Text(this.texto, style: TextStyle(color: (provider.index == this.index)? colores.naranja : (provider.index > 6 && this.texto == 'Beneficios') ?colores.naranja :Colors.white) ,)
          // Text(this.texto, style: TextStyle(color: (provider.index == this.index)? colores.naranja : Colors.white) ,)
        ],
      ),
    );
  }
}