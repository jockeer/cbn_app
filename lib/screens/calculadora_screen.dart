import 'package:cbn/utils/constantes.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CalculadoraScreen extends StatelessWidget {

  final estilos = EstilosApp();

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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Text('¿Cuándo debo presentar facturas?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20 ),),
                      SizedBox(height: 10,),
                      Text('Completa las celdas según corresponda', style: TextStyle( color: Colors.red[600], fontWeight: FontWeight.bold ),),
                      SizedBox(height: 30,),
                      
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Text('Ingresos')),
                          Container(
                            width: 100,
                            child: TextField(
                              decoration: estilos.inputDecoration(hintText: '0', circular: false),
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Text('Otros ingresos sujetos a RC-IVA')),
                          Container(
                            width: 100,
                            child: TextField(
                              decoration: estilos.inputDecoration(hintText: '0', circular: false),
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Text('Impuestos a Pagar (D - E)')),
                          Container(
                            width: 100,
                            child: TextField(
                              decoration: estilos.inputDecoration(hintText: '0', circular: false),
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Text('Saldo a favor del mes anterior')),
                          Container(
                            width: 100,
                            child: TextField(
                              decoration: estilos.inputDecoration(hintText: '0', circular: false),
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Text('Impuesto a pagar (F - G)')),
                          Container(
                            width: 100,
                            child: TextField(
                              decoration: estilos.inputDecoration(hintText: '0', circular: false),
                            ),
                          )
                        ],
                      ),
                      Divider(),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Text('Monto en facturas que puede presentar como pago a cuenta para cubrir el impuesto a pagar (Hx100/13)')),
                          Container(
                            width: 100,
                            child: TextField(
                              decoration: estilos.inputDecoration(hintText: '0', circular: false),
                            ),
                          )
                        ],
                      ),
                     
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}