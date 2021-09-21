import 'package:cbn/providers/providers.dart';
import 'package:cbn/services/usuarioService.dart';
import 'package:cbn/utils/carga.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:cbn/utils/snackbar.dart';
import 'package:cbn/utils/validator.dart';
import 'package:cbn/utils/verificar_internet.dart';
import 'package:cbn/widgets/fondo_pantalla.dart';
import 'package:cbn/widgets/top_logo.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinValidationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final usuario = ModalRoute.of(context)?.settings.arguments;
    return GestureDetector(
      onTap: (){
        final FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus && focus.hasFocus) return FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            FondoPantalla(img: 'fondoblanco.png'),
            SingleChildScrollView(
              child: Column(
                children: [
                  TopLogoWidget(),
                  _PinCard(usuario: usuario),
                  SizedBox(height: 30,),
                  _PinValidacion(usuario: usuario)
                ],
              ),
            )
    
          ],
        ),
      ),
    );
  }
}

class _PinValidacion extends StatelessWidget {
  final estilos = EstilosApp();
  final usuario;
  final usuarioService = UsuarioService();
  _PinValidacion({ required this.usuario });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: estilos.buttonStyle(),
      child: estilos.buttonChild(texto: 'Enviar pin nuevamente'),
      onPressed: ()async{
        print(this.usuario);
        await usuarioService.reenviarPIN(this.usuario);
      }, 
    );
  }
}

class _PinCard extends StatelessWidget {
  final estilos = EstilosApp();
  final validator = FormValidator();
  final usuarioService = UsuarioService();
  final usuario;
  _PinCard({ required this.usuario });
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistroProvider>(context);
    final size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        width: size.width*0.85,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('Revisa tu correo o espera un mensaje con tu PIN de validacion y luego dale al boton Validar PIN', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                decoration: estilos.inputDecoration(hintText: 'ingrese su pin de validacion'),
                onChanged: (value){
                  provider.pin = value;
                },
              ),
              SizedBox(height: 20,),

              ElevatedButton(
                style: estilos.buttonStyle(),
                child: estilos.buttonChild(texto: 'Validar PIN'),
                onPressed: (provider.pin.isEmpty || provider.pin.length < 4)
                  ? null
                  : () async {
                    if (!validator.isNumeric(provider.pin)) return mostrarSnackBar(context: context, mensaje: 'el pin no es valido');
                    final internet = await comprobarInternet();
                    if (!internet) return mostrarSnackBar(context: context, mensaje: 'Compruebe su conexion a internet e intentelo de nuevo');
                    loading(titulo: 'Validando pin...', context: context);
                    final validarPin = await usuarioService.validarPin( int.parse(provider.pin), this.usuario["id"] );
                    Navigator.pop(context);
                    if (!validarPin["ok"]) return mostrarSnackBar(context: context, mensaje: 'pin no valido');
                    
                    showDialog(context: context, builder: (context){ return SuccessAlert(titulo: 'Cuenta creada',);});
                  },
              )
            ],
          ),
        ),
      ),
    );
  }
}