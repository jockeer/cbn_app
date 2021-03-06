import 'package:cbn/models/perfil.dart';
import 'package:cbn/providers/perfil_provider.dart';
import 'package:cbn/services/usuarioService.dart';
import 'package:cbn/utils/carga.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:cbn/utils/preferencias_usuario.dart';
import 'package:cbn/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PerfilScreen extends StatelessWidget {
  final usuarioService = UsuarioService();
  final formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus && focus.hasFocus)
          return FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        body: FutureBuilder(
          future: usuarioService.cargarPerfil(context),
          builder: (_, AsyncSnapshot<PerfilModel?> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  _FotoPerfil(
                    foto: snapshot.data!.foto,
                    formStateButto: formState,
                  ),
                  Expanded(
                      child: _NuestrosDatos(
                    perfil: snapshot.data!,
                    formState: formState,
                  ))
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class _FotoPerfil extends StatelessWidget {
  final colores = ColoresApp();
  final foto;
  final usuarioService = UsuarioService();
  final constantes = DatosConstantes();
  final GlobalKey<FormState> formStateButto;
  _FotoPerfil({required this.foto, required this.formStateButto});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PerfilProvider>(context);
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
            child: Stack(children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
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
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.camera_alt,
                    size: 30,
                  ),
                  color: colores.naranja,
                ),
              ),
              (provider.editPerfil)
                  ? Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          provider.editPerfil = false;
                        },
                        icon: Icon(
                          Icons.cancel_outlined,
                          size: 30,
                        ),
                        color: colores.naranja,
                      ),
                    )
                  : Container(),
              (!provider.editPerfil)
                  ? Positioned(
                      top: 0,
                      right: 0,
                      bottom: 0,
                      child: IconButton(
                        onPressed: () {
                          provider.editPerfil = true;
                        },
                        icon: Icon(
                          Icons.edit,
                          size: 30,
                        ),
                        color: colores.naranja,
                      ),
                    )
                  : Positioned(
                      top: 40,
                      right: 0,
                      child: IconButton(
                        onPressed: () async {
                          //provider.editPerfil = false;
                          if (!this.formStateButto.currentState!.validate())
                            return;
                          final parametros = {
                            "cellphone": provider.telefono,
                            "internal": provider.interno,
                            "user_email": provider.correo,
                            "height": provider.estatura,
                            "marital_status": provider.estadoCivil,
                            "id_polera": provider.idpolera,
                            "pantalon": provider.idpantalon,
                            "zapato": provider.idzapato,
                            "address": provider.direccion,
                            "id_escolaridad": provider.idEscolaridad
                          };
                          loading(
                              titulo: 'actualizando Perfil', context: context);
                          final resp = await usuarioService
                              .actualizarDatosPerfil(parametros);
                          Navigator.pop(context);
                          if (resp["ok"]) {
                            mostrarSnackBar(
                                context: context,
                                mensaje: 'Perfil actualizado!',
                                color: Colors.green);
                          } else {
                            mostrarSnackBar(
                                context: context,
                                mensaje: 'Error al actualizar');
                          }
                          print(resp);
                          provider.editPerfil = false;

                          print(parametros);
                        },
                        icon: Icon(
                          Icons.save,
                          size: 30,
                        ),
                        color: colores.naranja,
                      ),
                    )
            ]),
          )
        ],
      ),
    );
  }
}

class _NuestrosDatos extends StatelessWidget {
  final colores = ColoresApp();
  final PerfilModel perfil;

  final GlobalKey<FormState> formState;

  _NuestrosDatos({required this.perfil, required this.formState});
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
                _Datos(perfil: perfil, miformState: this.formState),
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
        _Dato(titulo: 'D??as Vacaci??n', texto: this.perfil.vacation.toString()),
        _Dato(titulo: 'Oficina', texto: this.perfil.idEmpresa.toString()),
        _Dato(titulo: 'Puesto', texto: this.perfil.puesto.toString()),
        _Dato(
            titulo: 'C??digo Tributario',
            texto: this.perfil.codTributario.toString()),
        _Dato(
            titulo: 'C??digo Caja Salud',
            texto: this.perfil.codCajaSalud.toString()),
      ],
    );
  }
}

class _Datos extends StatelessWidget {
  final PerfilModel perfil;
  final colores = ColoresApp();
  final estilos = EstilosApp();
  final GlobalKey<FormState> miformState;
  _Datos({required this.perfil, required this.miformState});
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PerfilProvider>(context);
    return Form(
      key: this.miformState,
      child: ListView(
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
          (!provider.editPerfil)
              ? _Dato(
                  titulo: 'Tel??fono',
                  texto: this.perfil.cellphone!,
                )
              : _TelefonoEditable(
                  titulo: 'Tel??fono', texto: this.perfil.cellphone!),
          (!provider.editPerfil)
              ? _Dato(
                  titulo: 'Interno',
                  texto: this.perfil.internal!,
                )
              : _InternoEditable(
                  titulo: 'Interno', texto: this.perfil.internal!),
          (!provider.editPerfil)
              ? _Dato(
                  titulo: 'Correo Electr??nico',
                  texto: this.perfil.email!,
                )
              : _CorreoEditable(
                  titulo: 'Correo Electr??nico', texto: this.perfil.email!),
          (!provider.editPerfil)
              ? _Dato(
                  titulo: 'Direcci??n',
                  texto: this.perfil.address!,
                )
              : _DireccionEditable(
                  titulo: 'Direcci??n', texto: this.perfil.address!),
          (!provider.editPerfil)
              ? _Dato(
                  titulo: 'Estado Civil',
                  texto: this.perfil.maritalStatus!,
                )
              : _EstadoCivil(),

          // _Dato(
          //   titulo: 'Numero de hijos',
          //   texto: this.perfil.numberSons?.toString() ?? "",
          // ),
          (!provider.editPerfil)
              ? _Dato(
                  titulo: 'Escolaridad',
                  texto: this.perfil.idEscolaridad ?? "",
                )
              : _GradoEscolaridadSeleccionable(),
          (!provider.editPerfil)
              ? _Dato(
                  titulo: 'Estatura',
                  texto: this.perfil.height!,
                )
              : _EstaturaEditable(
                  titulo: 'Estatura', texto: this.perfil.height!),
          (!provider.editPerfil)
              ? _Dato(
                  titulo: 'Polera',
                  texto: this.perfil.polera ?? "",
                )
              : _PoleraSeleccionable(),
          (!provider.editPerfil)
              ? _Dato(
                  titulo: 'Pantal??n',
                  texto: this.perfil.pantalon ?? "",
                )
              : _PantalonSeleccionable(),
          (!provider.editPerfil)
              ? _Dato(
                  titulo: 'Zapato',
                  texto: this.perfil.zapato ?? "",
                )
              : _ZapatoSeleccionable(),

          SizedBox(
            height: 20,
          ),
          // _Dato(titulo: 'Pantalon', texto: this.perfil.waistSize!,),
          // Divider(thickness: 2, height: 0,),
          // _Dato(titulo: 'Zapato', texto: this.perfil.footSize!,),
          Center(
            child: ElevatedButton(
              onPressed: () {
                prefs.token = '';
                Navigator.pushNamedAndRemoveUntil(
                    context, 'welcome', (route) => false);
                // Navigator.pushReplacementNamed(context, 'welcome');kck
              },
              child: estilos.buttonChild(texto: 'Cerrar sesi??n'),
              style: estilos.buttonStyle(),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class _EstadoCivil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<PerfilProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          ListTileTheme(
              dense: true,
              child: ListTile(
                title: Text(
                  'Estado Civil',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Container(
                  width: size.width * 0.4,
                  child: DropdownButton(
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_circle_down_outlined),
                    isExpanded: true,
                    value: provider.estadoCivil,
                    items: [
                      DropdownMenuItem(
                        child: Text('Soltero(a)'),
                        value: 'S',
                      ),
                      DropdownMenuItem(
                        child: Text('Casado(a)'),
                        value: 'C',
                      ),
                      DropdownMenuItem(
                        child: Text('Viudo(a)'),
                        value: 'V',
                      ),
                      DropdownMenuItem(
                        child: Text('Divorciado(a)'),
                        value: 'D',
                      ),
                    ],
                    onChanged: (value) {
                      provider.estadoCivil = value.toString();
                    },
                  ),
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

class _GradoEscolaridadSeleccionable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<PerfilProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          ListTileTheme(
              dense: true,
              child: ListTile(
                title: Text(
                  'Escolaridad',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Container(
                  width: size.width * 0.4,
                  child: DropdownButton(
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_circle_down_outlined),
                    isExpanded: true,
                    value: provider.idEscolaridad,
                    items: [
                      DropdownMenuItem(
                        child: Text('Primario'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('Secundario'),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text('Licenciatura'),
                        value: 4,
                      ),
                      DropdownMenuItem(
                        child: Text('Maestria'),
                        value: 5,
                      ),
                      DropdownMenuItem(
                        child: Text('Tecnico medio'),
                        value: 6,
                      ),
                      DropdownMenuItem(
                        child: Text('Tecnico superior'),
                        value: 7,
                      ),
                      DropdownMenuItem(
                        child: Text('Doctorado'),
                        value: 8,
                      ),
                    ],
                    onChanged: (value) {
                      provider.idEscolaridad = int.parse(value.toString());
                    },
                  ),
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

class _PoleraSeleccionable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<PerfilProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          ListTileTheme(
              dense: true,
              child: ListTile(
                title: Text(
                  'Polera',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Container(
                  width: size.width * 0.4,
                  child: DropdownButton(
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_circle_down_outlined),
                    isExpanded: true,
                    value: provider.idpolera,
                    items: [
                      DropdownMenuItem(
                        child: Text('XS'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('S'),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text('M'),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text('L'),
                        value: 4,
                      ),
                      DropdownMenuItem(
                        child: Text('XL'),
                        value: 5,
                      ),
                      DropdownMenuItem(
                        child: Text('XXL'),
                        value: 6,
                      ),
                      DropdownMenuItem(
                        child: Text('XXXL'),
                        value: 7,
                      ),
                    ],
                    onChanged: (value) {
                      provider.idpolera = int.parse(value.toString());
                    },
                  ),
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

class _PantalonSeleccionable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<PerfilProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          ListTileTheme(
              dense: true,
              child: ListTile(
                title: Text(
                  'Pantal??n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Container(
                  width: size.width * 0.4,
                  child: DropdownButton(
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_circle_down_outlined),
                    isExpanded: true,
                    value: provider.idpantalon,
                    items: [
                      DropdownMenuItem(
                        child: Text('32'),
                        value: 32,
                      ),
                      DropdownMenuItem(
                        child: Text('33'),
                        value: 33,
                      ),
                      DropdownMenuItem(
                        child: Text('34'),
                        value: 34,
                      ),
                      DropdownMenuItem(
                        child: Text('35'),
                        value: 35,
                      ),
                      DropdownMenuItem(
                        child: Text('36'),
                        value: 36,
                      ),
                      DropdownMenuItem(
                        child: Text('37'),
                        value: 37,
                      ),
                      DropdownMenuItem(
                        child: Text('38'),
                        value: 38,
                      ),
                      DropdownMenuItem(
                        child: Text('39'),
                        value: 39,
                      ),
                      DropdownMenuItem(
                        child: Text('40'),
                        value: 40,
                      ),
                      DropdownMenuItem(
                        child: Text('41'),
                        value: 41,
                      ),
                      DropdownMenuItem(
                        child: Text('42'),
                        value: 42,
                      ),
                      DropdownMenuItem(
                        child: Text('43'),
                        value: 43,
                      ),
                      DropdownMenuItem(
                        child: Text('44'),
                        value: 44,
                      ),
                      DropdownMenuItem(
                        child: Text('45'),
                        value: 45,
                      ),
                      DropdownMenuItem(
                        child: Text('46'),
                        value: 46,
                      ),
                      DropdownMenuItem(
                        child: Text('47'),
                        value: 47,
                      ),
                      DropdownMenuItem(
                        child: Text('48'),
                        value: 48,
                      ),
                      DropdownMenuItem(
                        child: Text('49'),
                        value: 49,
                      ),
                      DropdownMenuItem(
                        child: Text('50'),
                        value: 50,
                      ),
                    ],
                    onChanged: (value) {
                      provider.idpantalon = int.parse(value.toString());
                    },
                  ),
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

class _ZapatoSeleccionable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<PerfilProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          ListTileTheme(
              dense: true,
              child: ListTile(
                title: Text(
                  'Zapato',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Container(
                  width: size.width * 0.4,
                  child: DropdownButton(
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_circle_down_outlined),
                    isExpanded: true,
                    value: provider.idzapato,
                    items: [
                      DropdownMenuItem(
                        child: Text('35'),
                        value: 35,
                      ),
                      DropdownMenuItem(
                        child: Text('36'),
                        value: 36,
                      ),
                      DropdownMenuItem(
                        child: Text('37'),
                        value: 37,
                      ),
                      DropdownMenuItem(
                        child: Text('38'),
                        value: 38,
                      ),
                      DropdownMenuItem(
                        child: Text('39'),
                        value: 39,
                      ),
                      DropdownMenuItem(
                        child: Text('40'),
                        value: 40,
                      ),
                      DropdownMenuItem(
                        child: Text('41'),
                        value: 41,
                      ),
                      DropdownMenuItem(
                        child: Text('42'),
                        value: 42,
                      ),
                      DropdownMenuItem(
                        child: Text('43'),
                        value: 43,
                      ),
                      DropdownMenuItem(
                        child: Text('44'),
                        value: 44,
                      ),
                      DropdownMenuItem(
                        child: Text('45'),
                        value: 45,
                      ),
                    ],
                    onChanged: (value) {
                      provider.idzapato = int.parse(value.toString());
                    },
                  ),
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

class _EstaturaEditable extends StatelessWidget {
  final String titulo, texto;
  _EstaturaEditable({required this.titulo, required this.texto});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PerfilProvider>(context);
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
                  child: TextFormField(
                    initialValue: this.texto,
                    decoration: InputDecoration(),
                    onChanged: (value) {
                      provider.estatura = value;
                    },
                    validator: (value) {
                      provider.estatura = value.toString();
                      return null;
                    },
                  ),
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

class _TelefonoEditable extends StatelessWidget {
  final String titulo, texto;
  _TelefonoEditable({required this.titulo, required this.texto});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PerfilProvider>(context);
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
                  child: TextFormField(
                    initialValue: this.texto,
                    decoration: InputDecoration(),
                    onChanged: (value) {
                      provider.telefono = value;
                    },
                    validator: (value) {
                      if (value == "") {
                        return "el telefono no puede quedar vacio";
                      } else {
                        provider.telefono = value.toString();
                        return null;
                      }
                    },
                  ),
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

class _InternoEditable extends StatelessWidget {
  final String titulo, texto;
  _InternoEditable({required this.titulo, required this.texto});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PerfilProvider>(context);
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
                  child: TextFormField(
                    initialValue: this.texto,
                    decoration: InputDecoration(),
                    onChanged: (value) {
                      provider.interno = value;
                    },
                    validator: (value) {
                      provider.interno = value.toString();
                      return null;
                    },
                  ),
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

class _CorreoEditable extends StatelessWidget {
  final String titulo, texto;
  _CorreoEditable({required this.titulo, required this.texto});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PerfilProvider>(context);
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
                  child: TextFormField(
                    initialValue: this.texto,
                    decoration: InputDecoration(),
                    onChanged: (value) {
                      provider.correo = value;
                    },
                    validator: (value) {
                      provider.correo = value.toString();
                      return null;
                    },
                  ),
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

class _DireccionEditable extends StatelessWidget {
  final String titulo, texto;
  _DireccionEditable({required this.titulo, required this.texto});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PerfilProvider>(context);
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
                  child: TextFormField(
                    initialValue: this.texto,
                    decoration: InputDecoration(),
                    onChanged: (value) {
                      provider.direccion = value;
                    },
                    validator: (value) {
                      provider.direccion = value.toString();
                      return null;
                    },
                  ),
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
