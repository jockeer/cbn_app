
import 'package:cbn/models/customer.dart';
import 'package:cbn/providers/providers.dart';
import 'package:cbn/services/usuarioService.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:cbn/utils/carga.dart';
import 'package:cbn/utils/snackbar.dart';
import 'package:cbn/utils/verificar_internet.dart';
import 'package:cbn/widgets/fondo_pantalla.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RegisterPage2Screen extends StatelessWidget {

  final formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final CustomerModel customer = ModalRoute.of(context)?.settings.arguments as CustomerModel;
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
                    _Formulario(formState: formState, customer: customer,),
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
  final CustomerModel customer;
  final estilos = EstilosApp();
  _Formulario({required this.formState, required this.customer});

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
            _Cellphone(customer: this.customer,),
            estilos.inputLabel(label: 'Interno'),
            _Interno(customer: this.customer,),
            estilos.inputLabel(label: 'Direccion', obligatorio: true),
            _Address(customer: this.customer),
            
            SizedBox(height: 30,),
            _BotonRegistro(formState: this.formState,),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

class _Address extends StatelessWidget {
  final CustomerModel customer;
  final estilos = EstilosApp();

  _Address({ required this.customer });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: this.customer.address,
      decoration: estilos.inputDecoration(hintText: 'direccion'),
      validator: (value){
        this.customer.address=value;
      },
    );
  }
}

class _Interno extends StatelessWidget {
  final CustomerModel customer;
  final estilos = EstilosApp();

  _Interno({ required this.customer });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: this.customer.internal,
      decoration: estilos.inputDecoration(hintText: 'interno'),
      validator: (value) {
        this.customer.internal = value;
      }
    );
  }
}

class _Cellphone extends StatelessWidget {
  
  final CustomerModel customer;
  final estilos = EstilosApp();

  _Cellphone({ required this.customer });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: this.customer.cellphone,
      decoration: estilos.inputDecoration(hintText: 'Telefono / Celular'),
      validator: (value){
        if (value!.isEmpty) return "El numero telefonico es obligatorio";
        return null; 
      },
    );
  }
}

class _BotonRegistro extends StatelessWidget {
  final estilos = EstilosApp();
  final GlobalKey<FormState> formState;
  final usuarioService = UsuarioService();

  _BotonRegistro({ required this.formState});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistroProvider>(context);
    return ElevatedButton(
      style: estilos.buttonStyle(),
      child: estilos.buttonChild(texto: 'Registrar'),
      onPressed: ()async{
        final internet = await comprobarInternet();
        if (!internet) return mostrarSnackBar(context: context, mensaje: 'Compruebe su conexion a internet e intentelo de nuevo');
        
        loading(titulo: 'Registrando...', context: context);

        final registro = await usuarioService.registrarUsuario();
       
        await Future.delayed(Duration(seconds: 2),(){
          Navigator.pop(context);
        });
        provider.pin = '';
        Navigator.pushNamed(context, 'pin_validacion');

        // Navigator.pushNamedAndRemoveUntil(context, 'login', ModalRoute.withName('welcome'));
        
      },
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
    final provider = Provider.of<RegistroProvider>(context);
    return TextFormField(
      enableInteractiveSelection: false,
      controller: _inputFiledDateController,
      decoration: estilos.inputDecoration(hintText: provider.birthday),
      onTap: () async{
        FocusScope.of(context).requestFocus(new FocusNode());
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: new DateTime(DateTime.now().year - 20),
          firstDate: new DateTime(DateTime.now().year - 80),
          lastDate: new DateTime(DateTime.now().year - 18)
        );
         if ( picked != null ) {
      
           final fechaFormateada = DateFormat('yyyy-dd-MM').format(picked);
           provider.birthday = fechaFormateada.toString();
          }
    
      },
    );
  }
}