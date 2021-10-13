import 'package:cbn/providers/providers.dart';
import 'package:cbn/services/usuarioService.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:cbn/utils/snackbar.dart';
import 'package:cbn/utils/verificar_internet.dart';
import 'package:cbn/utils/carga.dart';
import 'package:cbn/widgets/fondo_pantalla.dart';
import 'package:cbn/widgets/top_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterValidationScreen extends StatelessWidget {
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
        appBar: AppBar(),
        body: SafeArea(
          child: Stack(
            children: [
              FondoPantalla(img: 'fondoblanco.png'),
              SingleChildScrollView(
                child: Column(
                  children: [
                    TopLogoWidget(),
                    SizedBox(
                      height: 50,
                    ),
                    _Formulario(formState: formState),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Formulario extends StatelessWidget {
  final GlobalKey<FormState> formState;
  final estilos = EstilosApp();
  _Formulario({required this.formState});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: this.formState,
        child: Column(
          children: [
            estilos.inputLabel(label: 'Legajo', obligatorio: true),
            _Legajo(),
            estilos.inputLabel(label: 'Carnet de Identidad', obligatorio: true),
            _Carnet(),
            SizedBox(
              height: 20,
            ),
            _BotonValidacion(
              formState: this.formState,
            ),
          ],
        ),
      ),
    );
  }
}

class _BotonValidacion extends StatelessWidget {
  final GlobalKey<FormState> formState;
  final pruebaService = UsuarioService();

  _BotonValidacion({required this.formState});

  final estilos = EstilosApp();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistroProvider>(context);
    return ElevatedButton(
      style: estilos.buttonStyle(),
      child: estilos.buttonChild(texto: 'Validar'),
      onPressed: () async {
        if (!this.formState.currentState!.validate()) return;
        final intenet = await comprobarInternet();
        if (!intenet)
          return mostrarSnackBar(
              context: context,
              mensaje: 'Revise su conexion a internet y vuelva a intentarlo');
        loading(titulo: 'Validando', context: context);
        final resp = await pruebaService.validarUsuario(
            legajo: provider.legajo, ci: provider.ci);
        Navigator.pop(context);
        if (resp == null)
          return mostrarSnackBar(
              context: context, mensaje: 'Datos incorrectos');
        if (resp == 0)
          return mostrarSnackBar(
              context: context,
              mensaje: 'Ya existe un usuario registrado con esos datos');
        Navigator.pushNamed(context, 'register_page1', arguments: resp);
      },
    );
  }
}

class _Carnet extends StatelessWidget {
  final estilos = EstilosApp();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistroProvider>(context);
    return TextFormField(
      obscureText: true,
      decoration: estilos.inputDecoration(hintText: 'Carnet de Identidad'),
      validator: (value) {
        provider.ci = value.toString();
        if (value!.isEmpty) return 'El Carnet es obligatorio';
      },
    );
  }
}

class _Legajo extends StatelessWidget {
  final estilos = EstilosApp();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistroProvider>(context);
    return TextFormField(
      decoration: estilos.inputDecoration(hintText: 'Legajo'),
      validator: (value) {
        provider.legajo = value.toString();
        if (value!.isEmpty) return 'El legajo es obligatorio';
      },
    );
  }
}
