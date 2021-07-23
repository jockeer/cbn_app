import 'package:flutter/material.dart';

import 'package:cbn/widgets/widgets.dart';

class TiendasAfiliadasScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(titulo: 'Tiendas Afiliadas'),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          ListTile(
            title: Text('Multicenter',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            subtitle: Text('Cupones: 30'),
            leading: Image(image: AssetImage('assets/icons/logoNegroCBN.png'),),
          ),
          Divider(),
          ListTile(
            title: Text('Fidalga',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            subtitle: Text('Cupones: 30'),
            leading: Image(image: AssetImage('assets/icons/logoNegroCBN.png'),),
          ),
          Divider(),
          ListTile(
            title: Text('Fridolin',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            subtitle: Text('Cupones: 30'),
            leading: Image(image: AssetImage('assets/icons/logoNegroCBN.png'),),
          ),
          Divider(),
          ListTile(
            title: Text('Farmacorp',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            subtitle: Text('Cupones: 30'),
            leading: Image(image: AssetImage('assets/icons/logoNegroCBN.png'),),
          ),
        ],
      ),
    );
  }
}