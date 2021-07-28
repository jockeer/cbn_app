import 'package:cbn/utils/constantes.dart';
import 'package:flutter/material.dart';
import 'package:cbn/widgets/widgets.dart';

class GiftCardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(titulo: 'Gift Card', centrado: true, bgColor: Colors.white, textColor: Colors.black ),
      body: Column(
        children: [
          _Cabecera(),
          _Transacciones(),
          SizedBox(height: 20,),
          _BotonRecarga(),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}

class _BotonRecarga extends StatelessWidget {
  final estilos = EstilosApp();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          child: estilos.buttonChild(texto: 'Recarga'),
          style: estilos.buttonStyle(oscuro: true),
          onPressed: (){
            Navigator.pushNamed(context, 'recarga_gift_card');
          },
        ),
        SizedBox(height: 10,),
        Text('Puedes recargar tu tarjeta')
      ],
    );
  }
}

class _Transacciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          ListTile(
            title: Text('Pago de prueba - Sucursal Norte', style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text('02/07/2021 16:20:48'),
            trailing: Text('Bs. 50.00', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Divider(),
          ListTile(
            title: Text('Pago de prueba - Sucursal Norte', style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text('02/07/2021 16:20:48'),
            trailing: Text('Bs. 50.00', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Divider(),
          ListTile(
            title: Text('Pago de prueba - Sucursal Norte', style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text('02/07/2021 16:20:48'),
            trailing: Text('Bs. 50.00', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Divider(),
          ListTile(
            title: Text('Pago de prueba - Sucursal Norte', style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text('02/07/2021 16:20:48'),
            trailing: Text('Bs. 50.00', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Divider(),
          ListTile(
            title: Text('Pago de prueba - Sucursal Norte', style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text('02/07/2021 16:20:48'),
            trailing: Text('Bs. 50.00', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Divider(),
          ListTile(
            title: Text('Pago de prueba - Sucursal Norte', style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text('02/07/2021 16:20:48'),
            trailing: Text('Bs. 50.00', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Divider(),
          ListTile(
            title: Text('Pago de prueba - Sucursal Norte', style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text('02/07/2021 16:20:48'),
            trailing: Text('Bs. 50.00', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Divider(),
          ListTile(
            title: Text('Pago de prueba - Sucursal Norte', style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text('02/07/2021 16:20:48'),
            trailing: Text('Bs. 50.00', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Divider(),
          ListTile(
            title: Text('Pago de prueba - Sucursal Norte', style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text('02/07/2021 16:20:48'),
            trailing: Text('Bs. 50.00', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Divider(),
          ListTile(
            title: Text('Pago de prueba - Sucursal Norte', style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text('02/07/2021 16:20:48'),
            trailing: Text('Bs. 50.00', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Divider(),
          ListTile(
            title: Text('Pago de prueba - Sucursal Norte', style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text('02/07/2021 16:20:48'),
            trailing: Text('Bs. 50.00', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Divider(),
          ListTile(
            title: Text('Pago de prueba - Sucursal Norte', style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text('02/07/2021 16:20:48'),
            trailing: Text('Bs. 50.00', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Divider(),
          
        ],
      ),
    );
  }
}

class _Cabecera extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height*0.25,
          width: double.infinity,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bs ',style: TextStyle(  fontWeight: FontWeight.bold, fontSize: size.width*0.06 ),overflow: TextOverflow.ellipsis,),
              Text('4625',style: TextStyle(  fontWeight: FontWeight.bold, fontSize: size.width*0.2 ),overflow: TextOverflow.ellipsis,),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          width: double.infinity,
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Ultimas Transacciones',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18),),
          ),
        )
      ],
    );
  }
}