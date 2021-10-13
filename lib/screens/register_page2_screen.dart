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
    final CustomerModel customer =
        ModalRoute.of(context)?.settings.arguments as CustomerModel;
    return GestureDetector(
      onTap: () {
        final FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus && focus.hasFocus)
          return FocusManager.instance.primaryFocus!.unfocus();
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
                    _Info(),
                    SizedBox(
                      height: 40,
                    ),
                    _Formulario(
                      formState: formState,
                      customer: customer,
                    ),
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

class _Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Text(
            'INGRESA INFORMACIÓN ADICIONAL',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Vamos a necesitar alguna información tuya para continuar con el registro',
            textAlign: TextAlign.center,
          ),
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
            _FechaNacimiento(customer: this.customer),
            estilos.inputLabel(label: 'Teléfono / Celular', obligatorio: true),
            _Cellphone(
              customer: this.customer,
            ),
            estilos.inputLabel(label: 'Interno'),
            _Interno(
              customer: this.customer,
            ),
            estilos.inputLabel(label: 'Dirección'),
            _Address(customer: this.customer),
            SizedBox(
              height: 30,
            ),
            _BotonRegistro(formState: this.formState, customer: this.customer),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class _Address extends StatelessWidget {
  final CustomerModel customer;
  final estilos = EstilosApp();

  _Address({required this.customer});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: this.customer.address,
      decoration: estilos.inputDecoration(hintText: 'Dirección'),
      validator: (value) {
        this.customer.address = value;
      },
    );
  }
}

class _Interno extends StatelessWidget {
  final CustomerModel customer;
  final estilos = EstilosApp();

  _Interno({required this.customer});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        initialValue: this.customer.internal,
        decoration: estilos.inputDecoration(hintText: 'Interno'),
        validator: (value) {
          this.customer.internal = value;
        });
  }
}

class _Cellphone extends StatelessWidget {
  final CustomerModel customer;
  final estilos = EstilosApp();

  _Cellphone({required this.customer});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: this.customer.cellphone,
      decoration: estilos.inputDecoration(hintText: 'Teléfono / Celular'),
      validator: (value) {
        this.customer.cellphone = value;
        if (value!.isEmpty) return "El numero telefónico es obligatorio";
        return null;
      },
    );
  }
}

class _BotonRegistro extends StatelessWidget {
  final estilos = EstilosApp();
  final CustomerModel customer;
  final GlobalKey<FormState> formState;
  final usuarioService = UsuarioService();

  _BotonRegistro({required this.formState, required this.customer});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistroProvider>(context);
    return ElevatedButton(
      style: estilos.buttonStyle(),
      child: estilos.buttonChild(texto: 'Registrar'),
      onPressed: () async {
        if (!this.formState.currentState!.validate()) return null;
        if (provider.birthday.isEmpty)
          return mostrarSnackBar(
              context: context, mensaje: "elija su fecha de nacimiento");
        final internet = await comprobarInternet();
        if (!internet)
          return mostrarSnackBar(
              context: context,
              mensaje: 'Compruebe su conexion a internet e intentelo de nuevo');

        loading(titulo: 'Registrando...', context: context);
        final registro =
            await usuarioService.registrarUsuario(this.customer, provider.foto);
        Navigator.pop(context);

        if (registro.containsKey("errors"))
          return mostrarSnackBar(
              context: context, mensaje: registro["errors"][0]["msg"]);
        if (!registro["ok"])
          return mostrarSnackBar(
              context: context, mensaje: 'Error al registrar usuario');

        provider.pin = '';

        Navigator.pushNamed(context, 'pin_validacion',
            arguments: registro["usuario"]);
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
      width: size.width * 0.45,
      height: size.width * 0.45,
      child: Stack(
        children: [
          (provider.foto == null)
              ? Center(
                  child: Image.asset(
                  'assets/icons/logonegro.png',
                  width: size.width * 0.5,
                ))
              : Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.file(
                      provider.foto!,
                      fit: BoxFit.cover,
                      width: size.width * 0.45,
                      height: size.width * 0.45,
                    ),
                  ),
                ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                  size: size.width * 0.10,
                ),
                onPressed: () async {
                  final ImagePicker _picker = new ImagePicker();
                  final XFile? photo =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (photo == null) {
                    print('No selecciono nada');
                    return;
                  }
                  print('tenemos imagen ${photo.path}');
                  provider.updateSelectedFoto(photo.path);
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.collections_rounded,
                  color: Colors.black,
                  size: size.width * 0.10,
                ),
                onPressed: () async {
                  final ImagePicker _picker = new ImagePicker();
                  final XFile? photo =
                      await _picker.pickImage(source: ImageSource.gallery);
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
  final CustomerModel customer;
  final estilos = EstilosApp();

  _FechaNacimiento({required this.customer});

  final TextEditingController _inputFiledDateController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistroProvider>(context);
    return TextFormField(
      enableInteractiveSelection: false,
      controller: _inputFiledDateController,
      decoration: estilos.inputDecoration(hintText: provider.birthday),
      onTap: () async {
        FocusScope.of(context).requestFocus(new FocusNode());
        DateTime? picked = await showDatePicker(
            context: context,
            initialDate: new DateTime(DateTime.now().year - 20),
            firstDate: new DateTime(DateTime.now().year - 80),
            lastDate: new DateTime(DateTime.now().year - 18));
        if (picked != null) {
          final fechaFormateada = DateFormat('yyyy-MM-dd').format(picked);
          provider.birthday = fechaFormateada.toString();
          this.customer.birthday = provider.birthday;
        } else {
          this.customer.birthday = null;
        }
      },
    );
  }
}
