import 'package:cbn/utils/constantes.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CalculadoraScreen extends StatefulWidget {
  @override
  State<CalculadoraScreen> createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  final estilos = EstilosApp();
  double salarioMinimo = 2164;
  double ingresos = 0;
  double descSegSocial = 0;
  double descApoSolidario = 0;
  double oIngresos = 0;
  double ingNeto = 0;
  double salarioMinimoDoble = 4328;
  double diferencia = 0;
  double impDeterminados = 0;
  double salariosMinimosPor = 0;
  double impPagar = 0;
  double saldoIVA = 0;
  double impAPagar = 0;
  double montoFacturas = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus && focus.hasFocus)
          return FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              // FondoPantalla(img: 'fondoblanco.png'),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '¿Cuándo debo presentar facturas?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Completa las celdas según corresponda',
                        style: TextStyle(
                            color: Colors.red[600],
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Text('Ingresos')),
                          Container(
                            width: 100,
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              decoration: estilos.inputDecoration(
                                  hintText: '0', circular: false),
                              onChanged: (value) {
                                setState(() {
                                  if (value.isEmpty) {
                                    ingresos = 0;
                                  } else {
                                    ingresos = double.parse(value);
                                  }
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Text('Otros ingresos sujetos a RC-IVA')),
                          Container(
                            width: 100,
                            child: TextField(
                              decoration: estilos.inputDecoration(
                                  hintText: '0', circular: false),
                              onChanged: (value) {
                                setState(() {
                                  if (value.isEmpty) {
                                    oIngresos = 0;
                                  } else {
                                    oIngresos = double.parse(value);
                                  }
                                });
                              },
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
                            child: Text(impPagar.toStringAsFixed(2)),
                          )
                        ],
                      ),
                      Divider(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child:
                                  Text('Saldo IVA a favor del mes anterior')),
                          Container(
                            width: 100,
                            child: TextField(
                              decoration: estilos.inputDecoration(
                                  hintText: '0', circular: false),
                              onChanged: (value) {
                                setState(() {
                                  if (value.isEmpty) {
                                    saldoIVA = 0;
                                  } else {
                                    saldoIVA = double.parse(value);
                                  }
                                });
                              },
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
                            child: Text(impAPagar.toStringAsFixed(2)),
                          )
                        ],
                      ),
                      Divider(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Text(
                                  'Monto en facturas que puede presentar como pago a cuenta para cubrir el impuesto a pagar (Hx100/13)')),
                          Container(
                            width: 100,
                            child: Text(montoFacturas.toStringAsFixed(2)),
                          )
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (ingresos > (60 * salarioMinimo)) {
                              descSegSocial = (60 * salarioMinimo) * 0.1271;
                            } else {
                              descSegSocial = (ingresos * 0.1271);
                            }
                            if (ingresos > 13000) {
                              descApoSolidario = (ingresos - 13000) * 0.01;
                            }
                            if (ingresos > 25000) {
                              descApoSolidario += (ingresos - 25000) * 0.05;
                            }
                            if (ingresos > 35000) {
                              descApoSolidario += (ingresos - 35000) * 0.1;
                            }

                            ingNeto = ingresos -
                                descSegSocial -
                                descApoSolidario +
                                oIngresos;
                            diferencia = ingNeto - salarioMinimoDoble;

                            impDeterminados = diferencia * 0.13;
                            salariosMinimosPor = salarioMinimoDoble * 0.13;
                            impPagar = impDeterminados - salariosMinimosPor;
                            impAPagar = impPagar - saldoIVA;

                            montoFacturas = (impAPagar * 100) / 13;
                          });
                        },
                        child: Text('Calcular'),
                      )
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
