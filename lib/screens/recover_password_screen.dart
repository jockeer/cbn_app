import 'package:cbn/utils/constantes.dart';
import 'package:cbn/utils/validator.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RecoverPassScreen extends StatelessWidget {

  final formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final FocusScopeNode focus =FocusScope.of(context);
        if(!focus.hasPrimaryFocus && focus.hasFocus ) return FocusManager.instance.primaryFocus!.unfocus(); 
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TopLogoWidget(),
                SizedBox(height: 20,),
                Text('CONTRASEÑA OLVIDADA', style: TextStyle( fontWeight: FontWeight.bold ),),
                _Formulario(formState: formState)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Formulario extends StatelessWidget {

  final GlobalKey<FormState> formState;
  final estilos = EstilosApp();
  final validator = FormValidator();
  _Formulario({ required this.formState });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Form(
        key: this.formState,
        child: Column(
          children: [
            estilos.inputLabel(label: 'Correo electrónico', obligatorio: true),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: estilos.inputDecoration(hintText: 'Ingrese su email'),
              validator: ( value ){
                if (value!.isEmpty) return "EL correo electrónico es necesario para recuperar la contraseña";
                if (!validator.validarEmail(value)) return "Ingrese un correo electrónico valido";
                return null;
              },
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              style: estilos.buttonStyle(),
              child: estilos.buttonChild(texto: 'Enviar'),
              onPressed: (){
                if (!this.formState.currentState!.validate()) return;
              }
            )
          ],
        ),
      ),
    );
  }
}