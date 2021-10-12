import 'package:cbn/search/glosario_search.dart';
import 'package:cbn/services/infoService.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:cbn/widgets/fondo_pantalla.dart';
import 'package:flutter/material.dart';

class GlosarioScreen extends StatelessWidget {

  final infoService = InfoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FondoPantalla(img: 'fondoWhite.png'),
            Column(
                children: [
                  _Encabezado(),
                  IconButton(
                    onPressed: ()=> showSearch(context: context, delegate: GlosarioSearchDelegate()), 
                    icon: Icon(Icons.search)
                  ),
                  _Glosarios(),
                ],
              ),

          ],
        ),
        
      ),
    );
  }
}

class _Glosarios extends StatelessWidget {
  final infoService = InfoService();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: FutureBuilder(
          future: infoService.obtenerGlosario(),
          builder: ( _ , AsyncSnapshot snapshot){
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: ( _, index){
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child:Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container( alignment: Alignment.center ,width: size.width * 0.2 ,child: Text(snapshot.data[index]["acronimo"], style: TextStyle( fontWeight: FontWeight.bold, fontSize: 14 ),)),
                          Text(snapshot.data[index]["definicion"], style: TextStyle( fontSize: 14 ),),
                        ],
                      )
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator(),);
          },
        ),
    );
  }
}

class _Encabezado extends StatelessWidget {

  final colores = ColoresApp();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: colores.naranjaClaro,
        ),
        child: Row(
          children: [
            Text('Acronimo', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white ) ,),
            Expanded(child: Container()),
            Text('Definicion', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white ) ,),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}