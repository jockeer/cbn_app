import 'package:cbn/utils/constantes.dart';
import 'package:cbn/widgets/appbar.dart';
import 'package:flutter/material.dart';

class InformaScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(titulo: 'CBN Informa',centrado: true),
      body: ListView(
        children: [
          SizedBox(height: 10,),
          _InfoCard( titulo: 'Presentacion de facturas Octubre', fecha: 'Miercoles, 14 de Noviembre',),
          _InfoCard( titulo: 'Presentacion de facturas Octubre', fecha: 'Miercoles, 14 de Noviembre',),
          _InfoCard( titulo: 'Presentacion de facturas Octubre', fecha: 'Miercoles, 14 de Noviembre',),
          _InfoCard( titulo: 'Presentacion de facturas Octubre', fecha: 'Miercoles, 14 de Noviembre',),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {

  final String titulo,fecha;
  final estilos = EstilosApp();

  _InfoCard({ required this.titulo, required this.fecha});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Row(
        children: [
          Container(width: size.width*0.45, height: size.width*0.5, color: Colors.grey[800],),
          Container(
            width: size.width*0.55,
            height: size.width*0.5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(child: Text(this.titulo, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                  SizedBox(height: 10,),
                  Text(this.fecha, style: TextStyle(fontSize: 10, color: Colors.grey[600]),),
                  Expanded(child: Container(),),
                  Container(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
            
                      style: estilos.buttonStyle(oscuro: true,),
                      child: estilos.buttonChild(texto: 'Ver mas',size: 14, ph: 10, pv: 0),
                      onPressed: (){

                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}