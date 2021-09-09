import 'package:cbn/services/infoService.dart';
import 'package:cbn/widgets/appbar.dart';
import 'package:flutter/material.dart';


class GestionScreen extends StatelessWidget {

  final infoService = InfoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(titulo: 'Gestión institucional', centrado: true),
      body: SafeArea(
        child: FutureBuilder(
            future: infoService.obtenerGlosario(),
            builder: ( _ , AsyncSnapshot snapshot){
              if (snapshot.hasData) {
                return Center(child: Text('datos'),);
              }
              return Center(child: CircularProgressIndicator(),);
            },
          )
      ),
    );
  }
}