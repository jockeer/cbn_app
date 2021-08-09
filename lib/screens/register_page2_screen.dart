
import 'package:cbn/providers/providers.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:cbn/widgets/fondo_pantalla.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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
            child: Stack(
              children: [
                FondoPantalla(img: 'fondoblanco.png'),
                Column(
                  children: [
                    _Info(),
                    SizedBox(height: 40,),
                    _Formulario(formState: formState,),
                  ],
                ),
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
            estilos.inputLabel(label: 'Foto de perfil'),
            _FotoPerfil(),
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

class _FotoPerfil extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<RegistroProvider>(context);
    return Container(
      width: 150,
      height: 150,
      child: Stack(
        children: [
          (provider.foto == null)
            ? Center(child: Image.asset('assets/icons/logoNegroCBN.png', width: size.width*0.5,))
            : Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.file(provider.foto!,
                  fit: BoxFit.cover,
                  width: size.width*0.5,
                  height: size.width*0.5,
                ),
              ),
            )
          ,
          Positioned(
            bottom: 0,
            right: 0,
            child: Center(
              child: IconButton(
                icon: Icon(Icons.camera_alt, color: Colors.black, size: size.width*0.13,),
                onPressed: () async {
                  final ImagePicker _picker = new ImagePicker();
                  final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
                  if (photo == null) {
                    print('No selecciono nada');
                    return;
                  }
                  print('tenemos imagen ${photo.path}');
                  provider.updateSelectedFoto(photo.path);
                },
              ),
            ),
          )
        ],
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