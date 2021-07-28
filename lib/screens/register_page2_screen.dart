import 'package:cbn/utils/constantes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterPage2Screen extends StatelessWidget {

  final formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus && focus.hasFocus) return FocusManager.instance.primaryFocus!.unfocus();
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
            estilos.inputLabel(label: 'Fecha de nacimiento', obligatorio: true),
            _FechaNacimiento(),
            estilos.inputLabel(label: 'Telefono / Celular', obligatorio: true),
            TextFormField(
              decoration: estilos.inputDecoration(hintText: 'Telefono / Celular'),
            ),
            estilos.inputLabel(label: 'Interno'),
            TextFormField(
              decoration: estilos.inputDecoration(hintText: 'interno'),
            ),
            estilos.inputLabel(label: 'Direccion', obligatorio: true),
            TextFormField(
              decoration: estilos.inputDecoration(hintText: 'direccion'),
            ),
            
            SizedBox(height: 30,),
            ElevatedButton(
              style: estilos.buttonStyle(),
              child: estilos.buttonChild(texto: 'Registrar'),
              onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, 'login', ModalRoute.withName('welcome'));
              },
            )
          ],
        ),
      ),
    );
  }
}

class _FechaNacimiento extends StatelessWidget {

  final estilos = EstilosApp();
  final TextEditingController _inputFiledDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: false,
      controller: _inputFiledDateController,
      decoration: estilos.inputDecoration(hintText: 'Fecha de nacimiento'),
      onTap: () async{
        FocusScope.of(context).requestFocus(new FocusNode());
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: new DateTime(DateTime.now().year - 20),
          firstDate: new DateTime(DateTime.now().year - 80),
          lastDate: new DateTime(DateTime.now().year - 18)
        );
         if ( picked != null ) {
      
           final fechaFormateada = DateFormat('dd/MM/yyyy').format(picked);
           print(fechaFormateada);
          }
    
      },
    );
  }
}