import 'package:cbn/utils/constantes.dart';
import 'package:flutter/material.dart';

class SuccessAlert extends StatelessWidget {

  final String titulo;
  final estilos = EstilosApp();

  SuccessAlert({ required this.titulo });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this.titulo),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Usuario creado correctamente')
        ],
        
      ),
      actions: [
        ElevatedButton(
          style: estilos.buttonStyle(oscuro: true),
          child: estilos.buttonChild(texto: 'ok'),
          onPressed: (){
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(context, 'login' , ModalRoute.withName('welcome'));
          },
        )
      ],
    );
  }
}