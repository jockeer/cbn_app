import 'package:flutter/material.dart';

import 'package:cbn/utils/constantes.dart';
import 'package:cbn/utils/validator.dart';
import 'package:cbn/widgets/widgets.dart';

class RegisterPage1Screen extends StatelessWidget {

  final formState = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus && focus.hasFocus) return  FocusManager.instance.primaryFocus!.unfocus();
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
                    _Formulario(formState: formState,),
                  ],
                ),
              ),

            ],
          ),
        ),
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
        key: formState,
        child: Column(
          children: [
            estilos.inputLabel(label: 'Nombre(s)', obligatorio: true),
            _FirstName(),
            estilos.inputLabel(label: 'Apellido(s)', obligatorio: true),
            _LastName(),
            estilos.inputLabel(label: 'Correo electrónico', obligatorio: true),
            _Email(),
            estilos.inputLabel(label: 'Legajo', obligatorio: true),
            _Legajo(),
            estilos.inputLabel(label: 'Carnet de identidad', obligatorio: true),
            _Carnet(),
            SizedBox(height: 50,),
            _NextButton(formState: this.formState,),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}

class _FirstName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final estilos = EstilosApp();
    return TextFormField(
      decoration: estilos.inputDecoration(hintText: 'Nombre'),
      validator: (value){
        if (value!.isEmpty) return 'El nombre es obligatorio';
        return null;
      },
    );
  }
}

class _LastName extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final estilos = EstilosApp();
    return TextFormField(
      decoration: estilos.inputDecoration(hintText: 'Apellido'),
      validator: (value){
        if (value!.isEmpty) return 'El apellido es obligatorio';
        return null;
      },
    );
  }
}

class _Legajo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final estilos = EstilosApp();
    return TextFormField(
      decoration: estilos.inputDecoration(hintText: 'Legajo'),
      validator: (value){
        if (value!.isEmpty) return 'El legajo es obligatorio';
        return null;
      },
    );
  }
}
class _Carnet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final estilos = EstilosApp();
    return TextFormField(
      decoration: estilos.inputDecoration(hintText: 'Carnet de identidad'),
      validator: (value){
        if (value!.isEmpty) return 'El carnet es obligatorio';
        return null;
      },
    );
  }
}

class _Email extends StatelessWidget {

  final validator = FormValidator();
  
  @override
  Widget build(BuildContext context) {
    final estilos = EstilosApp();
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: estilos.inputDecoration(hintText: 'Correo electrónico'),
      validator: (value){
        if (value!.isEmpty) return 'El email es obligatorio';
        if (!validator.validarEmail(value)) return 'El email no es valido';
        return null;
      },
    );
  }
}

class _NextButton extends StatelessWidget {

  final GlobalKey<FormState> formState;

  _NextButton({required this.formState});

  @override
  Widget build(BuildContext context) {
    final estilos = EstilosApp();
    return ElevatedButton(
      style: estilos.buttonStyle(),
      child: estilos.buttonChild(texto: 'Siguiente'),
      onPressed: (){
        // if (!this.formState.currentState!.validate()) return;
        Navigator.pushNamed(context, 'register_page2');
      },
    );
  }
}