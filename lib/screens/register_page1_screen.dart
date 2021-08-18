import 'package:cbn/models/customer.dart';
import 'package:cbn/providers/providers.dart';
import 'package:flutter/material.dart';

import 'package:cbn/utils/constantes.dart';
import 'package:cbn/utils/validator.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RegisterPage1Screen extends StatelessWidget {

  final formState = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    final CustomerModel customer = ModalRoute.of(context)!.settings.arguments as CustomerModel;
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
                    _Formulario(formState: formState, customer: customer,),
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
  final CustomerModel customer;
  final estilos = EstilosApp();

  _Formulario({required this.formState, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formState,
        child: Column(
          children: [
            estilos.inputLabel(label: 'Nombre(s)', obligatorio: true,),
            _FirstName(customer: this.customer,),
            estilos.inputLabel(label: 'Apellido(s)', obligatorio: true,),
            _LastName(customer: this.customer,),
            estilos.inputLabel(label: 'Correo electrónico', obligatorio: true,),
            _Email(customer: this.customer,),
            estilos.inputLabel(label: 'Legajo', obligatorio: true,),
            _Legajo(customer: this.customer,),
            estilos.inputLabel(label: 'Carnet de identidad', obligatorio: true,),
            _Carnet(customer: this.customer,),
            SizedBox(height: 50,),
            _NextButton(formState: this.formState, customer: this.customer,),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}

class _FirstName extends StatelessWidget {
  final CustomerModel customer;
  _FirstName({ required this.customer });
  @override
  Widget build(BuildContext context) {
    final estilos = EstilosApp();
    return TextFormField(
      decoration: estilos.inputDecoration(hintText: 'Nombre'),
      initialValue: this.customer.name,
      validator: (value){
        this.customer.name = value;
        if (value!.isEmpty) return 'El nombre es obligatorio';
        return null;
      },
    );
  }
}

class _LastName extends StatelessWidget {

  final CustomerModel customer;
  _LastName({ required this.customer });

  @override
  Widget build(BuildContext context) {
    final estilos = EstilosApp();
    return TextFormField(
      decoration: estilos.inputDecoration(hintText: 'Apellido'),
      initialValue: this.customer.lastname,
      validator: (value){
         this.customer.lastname = value;
        if (value!.isEmpty) return 'El apellido es obligatorio';
        return null;
      },
    );
  }
}

class _Legajo extends StatelessWidget {

  final CustomerModel customer;
  _Legajo({ required this.customer });

  @override
  Widget build(BuildContext context) {
    final estilos = EstilosApp();
    return TextFormField(
      initialValue: this.customer.legajo,
      readOnly: true,
      decoration: estilos.inputDecoration(hintText: 'Legajo'),
      validator: (value){
        if (value!.isEmpty) return 'El legajo es obligatorio';
        return null;
      },
    );
  }
}
class _Carnet extends StatelessWidget {
  final CustomerModel customer;
  _Carnet({ required this.customer });

  @override
  Widget build(BuildContext context) {
    final estilos = EstilosApp();
    return TextFormField(
      initialValue: this.customer.ci,
      readOnly: true,
      decoration: estilos.inputDecoration(hintText: 'Carnet de identidad'),
      validator: (value){
        if (value!.isEmpty) return 'El carnet es obligatorio';
        return null;
      },
    );
  }
}

class _Email extends StatelessWidget {
  final CustomerModel customer;
  _Email({ required this.customer });

  final validator = FormValidator();
  
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistroProvider>(context);
    final estilos = EstilosApp();
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: estilos.inputDecoration(hintText: 'Correo electrónico'),
      validator: (value){
        this.customer.email = value;
        provider.email = value.toString();
        if (value!.isEmpty) return 'El email es obligatorio';
        if (!validator.validarEmail(value)) return 'El email no es valido';
        return null;
      },
    );
  }
}

class _NextButton extends StatelessWidget {

  final GlobalKey<FormState> formState;
  final CustomerModel customer;

  _NextButton({required this.formState, required this.customer});

  @override
  Widget build(BuildContext context) {
    final estilos = EstilosApp();
    return ElevatedButton(
      style: estilos.buttonStyle(),
      child: estilos.buttonChild(texto: 'Siguiente'),
      onPressed: (){
        if (!this.formState.currentState!.validate()) return;
        Navigator.pushNamed(context, 'register_page2', arguments: this.customer);
      },
    );
  }
}