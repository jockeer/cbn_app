import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CuponGiftcardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(titulo: 'Beneficios', centrado: true),
      body: SingleChildScrollView(
        child: _Menu()
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
          _MenuItem(titulo: 'Tiendas Afiliadas', ruta: 'tiendas_afiliadas',),
          SizedBox(height: 20,),
          _MenuItem(titulo: 'Cupones de descuentos', ruta: 'cupones',),
         
          SizedBox(height: 20,),
          _MenuItem(titulo: 'Tu Gift Card', ruta: 'tu_gift_card',),
         
          SizedBox(height: 20,),
          _MenuItem(titulo: 'Beneficios internos', ruta: 'recarga_gift_card',),
          
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String titulo, ruta;

  _MenuItem({ required this.titulo, required this.ruta });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, this.ruta);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Container(
          alignment: Alignment.bottomLeft,
          width: double.infinity,
          height: size.height*0.22,
          color: Colors.grey[500],
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