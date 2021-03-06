import 'package:cbn/utils/constantes.dart';
import 'package:cbn/widgets/appbar.dart';
import 'package:flutter/material.dart';

class InformaDetailScreen extends StatelessWidget {
  final colores = ColoresApp();
  final constantes = DatosConstantes();
  @override
  Widget build(BuildContext context) {
    final dynamic info = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: appBarWidget(
          titulo: 'CBN Informa', centrado: true, bgColor: colores.naranja),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                info["titulo"],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                info["fecha"],
                style: TextStyle(fontSize: 14),
              ),
              Divider(),
              SizedBox(
                height: 30,
              ),
              Image(
                  image: NetworkImage(
                      '${constantes.dominio}/uploads/imgInfo/${info["portada"]}')),
              SizedBox(
                height: 30,
              ),
              Text(
                info["texto"],
                style: TextStyle(fontSize: 14, letterSpacing: 0.5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
