import 'package:cbn/models/perfil.dart';
import 'package:cbn/services/usuarioService.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {

  final usuarioService = UsuarioService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
      title: Text('Perfil de usuario', style: TextStyle(color: Colors.white),), 
      backgroundColor: Colors.black, 
      iconTheme: IconThemeData(color: Colors.white),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.edit))
      ],
    ),
      body: SafeArea(
        child: FutureBuilder(
          future: usuarioService.cargarPerfil(),
          builder: ( _ , AsyncSnapshot<PerfilModel> snapshot){
            if (snapshot.hasData) {
              return ListView(
                children: [
                  SizedBox(height: 10,),
                  _FotoPerfil(foto: snapshot.data!.foto),
                  SizedBox(height: 10,),
                  _Datos()
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class _FotoPerfil extends StatelessWidget {
  final colores = ColoresApp();
  final foto;
  final constantes = DatosConstantes();
  _FotoPerfil({ required this.foto });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width*0.4,
        height: size.width*0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          image: DecorationImage(image: NetworkImage('${constantes.dominio}/uploads/fotoPerfil/$foto'),fit: BoxFit.cover)
        ),
        
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