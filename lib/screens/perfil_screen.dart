import 'package:cbn/utils/constantes.dart';
import 'package:cbn/widgets/appbar.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(titulo: 'Perfil de usuario', centrado: true),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 10,),
            _FotoPerfil(),
            SizedBox(height: 10,),
            _Datos(),
          ],
        ),
      ),
    );
  }
}

class _FotoPerfil extends StatelessWidget {
  final colores = ColoresApp();

  @override
  Widget build(BuildContext context) {
    
    return Container(
      alignment: Alignment.center,
      height: 160,
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/img/foto.jpg'), fit: BoxFit.cover),
          border: Border.all(width: 7, color: colores.plomo),
          borderRadius: BorderRadius.circular(500),
        ),
        // child: Image(image: AssetImage('assets/img/foto.jpg')),
      ),
    );
  }
}


class _Datos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          _Dato(titulo: 'Nombre', texto: 'Daniel',),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Apellidos', texto: 'Gorianz Ferrufino',),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Legajo', texto: '123456',),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Carnet de identidad', texto: '6804331',),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Fecha de nacimiento', texto: '21/02/1995',),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Telefono', texto: '76598228',),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Interno', texto: '335685',),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Mail', texto: 'dgorianz@loyaltyclubs.net',),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Direccion', texto: 'Direccion #662 Barrio CBN',),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Estado Civil', texto: 'Soltero',),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Numero de hij@s', texto: '0',),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Talla', texto: '1.70',),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Busto', texto: '',),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Cintura', texto: '',),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Pie', texto: '',),
          Divider(thickness: 2, height: 0,),  
          
        ],
      ),
    );
  }
}

class _Dato extends StatelessWidget {

  final String titulo, texto;

  _Dato({ required this.titulo, required this.texto });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListTileTheme(
      contentPadding: EdgeInsets.all(0),
      dense: true,
      child: ListTile(
        title: Text(this.titulo, style: TextStyle(fontWeight: FontWeight.bold),),
        trailing: Container( width: size.width*0.4,child: Text(this.texto),),
      )
    ); 
    
  }
}