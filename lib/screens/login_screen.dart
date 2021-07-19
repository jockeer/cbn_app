import 'package:cbn/providers/login_provider.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {

  final formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                Center(child: FlutterLogo(size: size.width*0.3,)),
                SizedBox(height: 50,),
                _Formulario(formState:formState)
              ],
            ),
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
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: this.formState,
        child: Column(
          children: [
            estilos.inputLabel(label: 'Usuario'),
            _UserName(),
            estilos.inputLabel(label: 'Contraseña'),
            _Password(),
            SizedBox(height: 50,),
            _LoginButton(formState: this.formState,),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'recover');
              },
              child: Text('¿Olvidaste tu contraseña?', style: TextStyle( fontSize: 16),),
            )
          ],
        ),
      ),
    );
  }
}

class _UserName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context, listen: false); 
    final estilos = EstilosApp();
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: estilos.inputDecoration(hintText: 'Usuario'),
      onChanged: (value){
        provider.user=value;
      },
      validator: (value){
        if(value!.isEmpty){
          return "El nombre de usuario es obligatorio";
        }
        return null;
      },
    );
  }
}

class _Password extends StatelessWidget {
  final estilos = EstilosApp();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context, listen: false);  
    return TextFormField(
      obscureText: true,
      decoration: estilos.inputDecoration(hintText: 'Contraseña'),
      onChanged: (value){
        provider.password=value;
      },
      validator: (value){
        if(value!.isEmpty){
          return "La contraseña es obligatoria";
        }
        return null;
      },
    );
  }
}


class _LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formState;
  
  _LoginButton({required this.formState});

  @override
  Widget build(BuildContext context) {
    final estilos = EstilosApp();
    //final provider = Provider.of<LoginProvider>(context, listen: false);
    return ElevatedButton(
      style: estilos.buttonStyle(),
      child: estilos.buttonChild(texto: 'Ingresa'),
      onPressed: (){
        if (!this.formState.currentState!.validate()) return;

        //print('${provider.user} ${provider.password}');
        Navigator.pushNamed(context, 'home');
      },
    );
  }
}