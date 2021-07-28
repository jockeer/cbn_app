import 'package:cbn/utils/constantes.dart';
import 'package:cbn/widgets/appbar.dart';
import 'package:cbn/widgets/top_logo.dart';
import 'package:flutter/material.dart';

class MetodoPagoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(titulo: 'Metodo Pago', bgColor: Colors.white,textColor: Colors.black),
      body: Column(
        children: [
          SizedBox(height: 20,),
          TopLogoWidget(),
          SizedBox(height: 30,),
          _MetodoPago()
        ],
      ),
    );
  }
}

class _MetodoPago extends StatelessWidget {
  final estilos = EstilosApp();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          child: Stack(
            children:[
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 60,
                    color: Colors.black,
                    child: Text('Metodo de Pago', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    color: Colors.grey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Seleccione', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          Icon(Icons.arrow_drop_down, color: Colors.white,)
                        ],
                      ),
                    ),
                  )

                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  border: Border.all(width: 5),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20) )
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                
                child: Container(
                  alignment: Alignment.center,
                  // width: 50,
                  child: ElevatedButton(
                    style: estilos.buttonStyle(),
                    child: estilos.buttonChild(texto: 'Siguiente'),
                    onPressed: (){},
              
                  ),
                ),
              )
            ] 
              
          ),
        ),
      ),
    );
  }
}