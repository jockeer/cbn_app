import 'package:cbn/utils/constantes.dart';
import 'package:flutter/material.dart';

class SuccessAlert extends StatelessWidget {
  final String titulo;
  final estilos = EstilosApp();
  final colores = ColoresApp();

  SuccessAlert({required this.titulo});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      // shape: BorderRad,
      actionsPadding: EdgeInsets.only(bottom: 20),
      backgroundColor: colores.naranja,
      title: Text(
        this.titulo,
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),

      actions: [
        Center(
          child: ElevatedButton(
            style: estilos.buttonStyle(oscuro: true),
            child: estilos.buttonChild(texto: 'Aceptar'),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                  context, 'login', ModalRoute.withName('welcome'));
            },
          ),
        )
      ],
    );
  }
}
