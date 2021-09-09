import 'package:cbn/utils/constantes.dart';
import 'package:cbn/widgets/appbar.dart';
import 'package:flutter/material.dart';

class CuponSeleccionadoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final dynamic cupon = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: appBarWidget(titulo: 'Cuponera de descuento', centrado: true),
      body: SafeArea(
        child: Column(
          children: [
            _Titulo(categoria: cupon["Categorium"]["nombre"], nombre: cupon["nombre"],),
            _Foto(foto: cupon["foto"],),
            _BotonSeleccionar(cupon: cupon,)
          ],
        ),
      ),
    );
  }
}

class _BotonSeleccionar extends StatelessWidget {

  final dynamic cupon;

  _BotonSeleccionar({ required this.cupon });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)), 
        color: Colors.grey[100],
      ),
      height: 150,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
  
          Text('${cupon["cantidad"]} Cupones disponibles'),
              
          ElevatedButton(
            onPressed: (){

            },
            child: Text('Obtener cupon'),
          )
        ],
      ),
    );
  }
}

class _Foto extends StatelessWidget {

  final String foto;
  final constantes = DatosConstantes();
  _Foto({ required this.foto });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Image(image: NetworkImage('${constantes.dominio}/uploads/fotoCupon/$foto'),height: size.width*0.6,),
      )
    );
  }
}

class _Titulo extends StatelessWidget {
  final String categoria, nombre;

  _Titulo({ required this.categoria, required this.nombre });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text('Descuento de $categoria',style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white ) ,),
            SizedBox(height: 10,),
            Text('$nombre',style: TextStyle( fontSize: 12, color: Colors.white70 ) ,),
          ],
        ),
      ),
    );
  }
}