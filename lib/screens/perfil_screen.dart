import 'package:cbn/models/perfil.dart';
import 'package:cbn/services/usuarioService.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {

  final usuarioService = UsuarioService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: usuarioService.cargarPerfil(context),
        builder: (_,  AsyncSnapshot<PerfilModel?> snapshot){
          if (snapshot.hasData) {
            return Column(
              children: [
                _FotoPerfil(foto: snapshot.data!.foto),
                Expanded(child: _NuestrosDatos(perfil: snapshot.data!))
              ],
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
      // body: SafeArea(
      //   child: Container(
      //     width: size.width,
      //     height: size.height,
      //     child: FutureBuilder(
      //       future: usuarioService.cargarPerfil(),
      //       builder: ( _ , AsyncSnapshot<PerfilModel> snapshot){
      //         if (snapshot.hasData) {
      //           return Column(
      //             children: [
      //               _FotoPerfil(foto: snapshot.data!.foto),
      //               _NuestrosDatos(perfil:  snapshot.data!)
      //               // SizedBox(height: 10,),
      //               // _NuestrosDatos(perfil: snapshot.data!,),
      //               // _Datos(perfil: snapshot.data!,)
      //             ],
      //           );
      //         }
      //         return Center(child: CircularProgressIndicator());
      //       },
      //     ),
      //   ),
      // ),
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
    return Container(
      height: size.width*0.35,
      child: Row(
        children: [
          Container(
            width: size.width*0.25,
            height: size.width*0.35,
            decoration: BoxDecoration(
              color: colores.naranjaClaro,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30))
            ),
            child: Center(child: Image(image: AssetImage('assets/icons/mapaNaranja.png'),width: size.width*0.2,)),
          ),
          Expanded(
            child: Container(
              child: (this.foto=='sin foto') ? Image(image: AssetImage('assets/icons/logonegro.png'), height: size.width*0.3,) : Image(image: NetworkImage('${constantes.dominio}/uploads/fotoPerfil/$foto'), fit: BoxFit.cover,),
            ),
          )
        ],
      ),
    );
    // return Center(
    //   child: Container(
    //     width: size.width*0.43,
    //     height: size.width*0.43,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(500),
    //       border: Border.all(width: 5, color: Colors.grey),
    //       // image: DecorationImage(
    //       //   image: (this.foto == 'sin foto')? ('assets/icons/logonegro.png') : NetworkImage('${constantes.dominio}/uploads/fotoPerfil/$foto'),
    //       //   fit: BoxFit.cover
    //       // )
    //     ),
    //     child: Center(
    //       child: (this.foto=='sin foto') ? Image(image: AssetImage('assets/icons/logonegro.png')) : Image(image: NetworkImage('${constantes.dominio}/uploads/fotoPerfil/$foto'))
    //     ),
        
    //   ),
    // );
  }
}

class _NuestrosDatos extends StatelessWidget {
  final colores = ColoresApp();
  final PerfilModel perfil;

  _NuestrosDatos({ required this.perfil });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          TabBar(
            isScrollable: false,
            indicatorColor: colores.naranja,
            indicatorWeight: 3.0,
            labelColor: Colors.black,
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 5,),
                    Text(
                      'Datos Personales',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.033),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_pin_sharp),
                    SizedBox(width: 5,),
                    Text(
                      'Datos de Usuario',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.033),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _Datos(perfil: perfil),
                Center(child: Text('ss'),)
              ],
            ),
          )
        ],
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
      
      child: ListView(
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
          // _Dato(titulo: 'Polera', texto: this.perfil.bustSize!,),
          // Divider(thickness: 2, height: 0,),  
          // _Dato(titulo: 'Pantalon', texto: this.perfil.waistSize!,),
          // Divider(thickness: 2, height: 0,),  
          // _Dato(titulo: 'Zapato', texto: this.perfil.footSize!,),
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