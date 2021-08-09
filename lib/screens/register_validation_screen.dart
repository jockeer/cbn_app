import 'package:cbn/utils/constantes.dart';
import 'package:cbn/widgets/top_logo.dart';
import 'package:flutter/material.dart';

class RegisterValidationScreen extends StatelessWidget {
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopLogoWidget(),
              SizedBox(height: 50,),
              _Formulario(formState: formState)
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
  _Formulario({ required this.formState });


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
            SizedBox(height: 20,),
            _BotonValidacion(formState: this.formState,),
          ],
        ),
      ),
    );
  }
}

class _BotonValidacion extends StatelessWidget {
  
  final GlobalKey<FormState> formState;

  _BotonValidacion({ required this.formState });

  final estilos = EstilosApp();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: estilos.buttonStyle(),
      child: estilos.buttonChild(texto: 'Validar'),
      onPressed: (){
        //if (!this.formState.currentState!.validate()) return;
        Navigator.pushNamed(context, 'register_page1');
      }, 
    );
  }
}

class _Carnet extends StatelessWidget {
  
  final estilos = EstilosApp();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: estilos.inputDecoration(hintText: 'Carnet de identidad'),
      validator: (value){
        if (value!.isEmpty) return 'El Carnet es obligatorio';
      },
    );
  }
}

class _Legajo extends StatelessWidget {

  final estilos = EstilosApp();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: estilos.inputDecoration(hintText: 'Legajo'),
      validator: (value){
        if (value!.isEmpty) return 'El legajo es obligatorio';
      },
    );
  }
}