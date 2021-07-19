import 'package:cbn/utils/constantes.dart';
import 'package:flutter/material.dart';

class RegisterPage2Screen extends StatelessWidget {

  final formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus && focus.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _Info(),
                SizedBox(height: 40,),
                _Formulario(formState: formState,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Text('INGRESA INFORMACIÓN ADICIONAL', style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text('Vamos a necesitar alguna información tuya para continuar con el registro', textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}

class _Formulario extends StatelessWidget {

  final formState;
  final estilos = EstilosApp();
  _Formulario({required this.formState});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: this.formState,
        child: Column(
          children: [
            estilos.inputLabel(label: 'Carnet de identidad', obligatorio: true),
            TextFormField(
              decoration: estilos.inputDecoration(hintText: 'Nro. Ci'),
            ),
            estilos.inputLabel(label: 'Ciudad de expedición', obligatorio: true),
            TextFormField(
              decoration: estilos.inputDecoration(hintText: 'expedicion'),
            ),
            estilos.inputLabel(label: 'Fecha de nacimiento', obligatorio: true),
            TextFormField(
              decoration: estilos.inputDecoration(hintText: 'Fecha de nacimiento'),
            ),
            estilos.inputLabel(label: 'Pais', obligatorio: true),
            TextFormField(
              decoration: estilos.inputDecoration(hintText: 'pais'),
            ),
            estilos.inputLabel(label: 'Ciudad', obligatorio: true),
            TextFormField(
              decoration: estilos.inputDecoration(hintText: 'Ciudad'),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              style: estilos.buttonStyle(),
              child: estilos.buttonChild(texto: 'Registrar'),
              onPressed: (){},
            )
          ],
        ),
      ),
    );
  }
}