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
        builder: (_, AsyncSnapshot<PerfilModel?> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                _FotoPerfil(foto: snapshot.data!.foto),
                Expanded(child: _NuestrosDatos(perfil: snapshot.data!))
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class _FotoPerfil extends StatelessWidget {
  final colores = ColoresApp();
  final foto;
  final constantes = DatosConstantes();
  _FotoPerfil({required this.foto});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.35,
      child: Row(
        children: [
          Container(
            width: size.width * 0.25,
            height: size.width * 0.35,
            decoration: BoxDecoration(
                color: colores.naranjaClaro,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(30))),
            child: Center(
                child: Image(
              image: AssetImage('assets/icons/mapaNaranja.png'),
              width: size.width * 0.2,
            )),
          ),
          Expanded(
            child: Container(
              child: (this.foto == 'sin foto')
                  ? Image(
                      image: AssetImage('assets/icons/logonegro.png'),
                      height: size.width * 0.3,
                    )
                  : Image(
                      image: NetworkImage(
                          '${constantes.dominio}/uploads/fotoPerfil/$foto'),
                      fit: BoxFit.cover,
                    ),
            ),
          )
        ],
      ),
    );
  }
}

class _NuestrosDatos extends StatelessWidget {
  final colores = ColoresApp();
  final PerfilModel perfil;

  _NuestrosDatos({required this.perfil});
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
                    SizedBox(
                      width: 5,
                    ),
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
                    SizedBox(
                      width: 5,
                    ),
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
                _DatosNoEditables(perfil: perfil)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _DatosNoEditables extends StatelessWidget {
  final PerfilModel perfil;

  _DatosNoEditables({required this.perfil});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _Dato(titulo: 'AFP', texto: this.perfil.afp.toString()),
        _Dato(titulo: 'NUA/CUA', texto: this.perfil.nuaCua.toString()),
        _Dato(titulo: 'Saldo IVA', texto: this.perfil.balanceIva.toString()),
        _Dato(titulo: 'Días Vacación', texto: this.perfil.vacation.toString()),
        _Dato(titulo: 'Oficina', texto: this.perfil.idEmpresa.toString()),
        _Dato(titulo: 'Puesto', texto: this.perfil.puesto.toString()),
        _Dato(
            titulo: 'Código Tributario',
            texto: this.perfil.codTributario.toString()),
        _Dato(
            titulo: 'Código Caja Salud',
            texto: this.perfil.codCajaSalud.toString()),
      ],
    );
  }
}

class _Datos extends StatelessWidget {
  final PerfilModel perfil;
  final colores = ColoresApp();
  final estilos = EstilosApp();
  _Datos({required this.perfil});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _Dato(
          titulo: 'Nombre(s)',
          texto: this.perfil.name!,
        ),
        _Dato(
          titulo: 'Apellido(s)',
          texto: this.perfil.lastname!,
        ),
        _Dato(
          titulo: 'Legajo',
          texto: this.perfil.legajo!,
        ),
        _Dato(
          titulo: 'Carnet de Identidad',
          texto: this.perfil.ci!,
        ),
        _Dato(
          titulo: 'Fecha de nacimiento',
          texto: this.perfil.birthday!,
        ),
        _Dato(
          titulo: 'Teléfono',
          texto: this.perfil.cellphone!,
        ),
        _Dato(
          titulo: 'Interno',
          texto: this.perfil.internal!,
        ),
        _Dato(
          titulo: 'Correo Electrónico',
          texto: this.perfil.email!,
        ),
        _Dato(
          titulo: 'Dirección',
          texto: this.perfil.address!,
        ),
        _Dato(
          titulo: 'Estado Civil',
          texto: this.perfil.maritalStatus!,
        ),
        _Dato(
          titulo: 'Numero de hijos',
          texto: this.perfil.numberSons?.toString() ?? "",
        ),
        _Dato(
          titulo: 'Talla',
          texto: this.perfil.height!,
        ),
        _Dato(
          titulo: 'Polera',
          texto: this.perfil.idPolera ?? "",
        ),
        _Dato(
          titulo: 'Pantalón',
          texto: this.perfil.pantalon ?? "",
        ),
        _Dato(
          titulo: 'Zapato',
          texto: this.perfil.zapato ?? "",
        ),
        SizedBox(
          height: 10,
        ),
        // _Dato(titulo: 'Pantalon', texto: this.perfil.waistSize!,),
        // Divider(thickness: 2, height: 0,),
        // _Dato(titulo: 'Zapato', texto: this.perfil.footSize!,),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'welcome');
          },
          child: estilos.buttonChild(texto: 'Cerrar sesion'),
          style: estilos.buttonStyle(),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class _Dato extends StatelessWidget {
  final String titulo, texto;

  _Dato({required this.titulo, required this.texto});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          ListTileTheme(
              dense: true,
              child: ListTile(
                title: Text(
                  this.titulo,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Container(
                  width: size.width * 0.4,
                  child: Text(this.texto),
                ),
              )),
          Divider(
            thickness: 2,
            height: 0,
          ),
        ],
      ),
    );
  }
}
