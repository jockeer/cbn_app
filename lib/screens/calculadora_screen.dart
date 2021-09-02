import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CalculadoraScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus && focus.hasFocus) return  FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: appBarWidget(titulo: 'Calculadora IVA', centrado: true),
        body: SafeArea(
          child: Stack(
            children: [
              FondoPantalla(img: 'fondoblanco.png'),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Text('¿Cuando debo presentar facturas?', style: TextStyle(fontWeight: FontWeight.bold ),),
                    Text('Completa las celdas segun corresponda'),
                    
                    ListTile(
                      title: Text('Ingresos'),
                      subtitle: TextField(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}