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
                  _Datos(perfil: snapshot.data!,)
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
        width: size.width*0.43,
        height: size.width*0.43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          border: Border.all(width: 5, color: Colors.grey),
          image: DecorationImage(image: NetworkImage('${constantes.dominio}/uploads/fotoPerfil/$foto'),fit: BoxFit.cover)
        ),
        
      ),
    );
  }
}

class _Datos extends StatelessWidget {

  final PerfilModel perfil;

  _Datos({ required this.perfil });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          _Dato(titulo: 'Nombre', texto: this.perfil.name!,),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Apellidos', texto: this.perfil.lastname!,),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Legajo', texto: this.perfil.legajo!,),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Carnet de identidad', texto: this.perfil.ci!,),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Fecha de nacimiento', texto: this.perfil.birthday!,),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Telefono', texto: this.perfil.cellphone!,),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Interno', texto: this.perfil.internal!,),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Mail', texto: this.perfil.email!,),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Direccion', texto: this.perfil.address!,),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Estado Civil', texto: this.perfil.maritalStatus!,),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Numero de hij@s', texto: this.perfil.numberSons!.toString(),),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Talla', texto: this.perfil.height!,),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Busto', texto: this.perfil.bustSize!,),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Cintura', texto: this.perfil.waistSize!,),
          Divider(thickness: 2, height: 0,),  
          _Dato(titulo: 'Pie', texto: this.perfil.footSize!,),
          Divider(thickness: 2, height: 0,),  
          SizedBox(height: 20,)
          
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