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
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _MenuItem(titulo: 'Glosario', ruta: 'cupon_gifcard')),
            Expanded(child: _MenuItem(titulo: 'Calculadora (IVA)', ruta: 'cupon_gifcard')),
          ],
        ),
        
        SizedBox(height: 10,),
        GestureDetector(
          onTap: (){Navigator.pushNamed(context, 'cupon_gifcard');},
          child: ClipRRect(
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
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Expanded(child: _MenuItem(titulo: 'Informa', ruta: 'cupon_gifcard')),
            Expanded(child: _MenuItem(titulo: 'Gestión institucional', ruta: 'cupon_gifcard')),
          ],
        ),
        Row(
          children: [
            Expanded(child: _MenuItem(titulo: 'InBox', ruta: 'cupon_gifcard')),
            Expanded(child: _MenuItem(titulo: 'Visualizador (IVA)', ruta: 'cupon_gifcard')),
          ],
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {

  final String titulo, ruta;

  final prefs = PreferenciasUsuario();
  
  _MenuItem({required this.titulo,required this.ruta});

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
                margin: EdgeInsets.symmetric( vertical: 10, horizontal: 6),
                height: size.width * 0.45,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30)
                ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          right: 20,
          child: Text(this.titulo, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)
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