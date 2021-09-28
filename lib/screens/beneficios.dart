
import 'package:cbn/providers/login_provider.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CuponGiftcardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(titulo: 'Beneficios', logo: 'cbnInforma.png',),
            _Menu(),
          ],
        )
      ),
    );
  }
}

class _Menu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          
          SizedBox(height: 20,),
          _MenuItem(titulo: 'Tiendas Afiliadas', ruta: 'tiendas_afiliadas', img: 'map.png', index: 7,),
          SizedBox(height: 20,),
          _MenuItem(titulo: 'Cupones de descuentos', ruta: 'cupones', img: 'cupon.png', index: 8,),
         
          SizedBox(height: 20,),
          _MenuItem(titulo: 'Tu Gift Card', ruta: 'tu_gift_card', img: 'gifcard.png', index: 9,),
         
          SizedBox(height: 20,),
          _MenuItem(titulo: 'Beneficios internos', ruta: 'recarga_gift_card', img: 'gift.png', index: 10,),
          
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String titulo, ruta, img;
  final int index;

  _MenuItem({ required this.titulo, required this.ruta, required this.img, required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        provider.index=this.index;
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[500],
            image: DecorationImage(image: AssetImage('assets/img/$img'), fit: BoxFit.cover)
          ),
          alignment: Alignment.bottomLeft,
          width: double.infinity,
          height: size.height*0.22,
          child: Container(
            width: double.infinity,
            color: Colors.black,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(this.titulo, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
            )
          ),
        ),
      ),
    );
  }
}