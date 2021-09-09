import 'package:cbn/services/infoService.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:cbn/widgets/appbar.dart';
import 'package:flutter/material.dart';

class InformaScreen extends StatelessWidget {

  final infoService = InfoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(titulo: 'CBN Informa',centrado: true),
      body: SafeArea(
        child: FutureBuilder(
          future: infoService.obtenerInformacion(),
          builder: ( _, AsyncSnapshot snapshot ){
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: ( _ , index) {
                  return _InfoCard(info: snapshot.data[index]);
                },
              );
            }
            return Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {

  final dynamic info;
  final estilos = EstilosApp();

  final constantes = DatosConstantes();

  _InfoCard({ required this.info});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Row(
        children: [
          Container(
            width: size.width*0.45, 
            height: size.width*0.5,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              
            ),
            child: FadeInImage(
              placeholder: AssetImage('assets/icons/logoNegroCBN.png'),
              image: NetworkImage('${constantes.dominio}/uploads/imgInfo/${this.info["portada"]}'),
              fit: BoxFit.cover,
            ), 
          ),
          Container(
            width: size.width*0.55,
            height: size.width*0.5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(child: Text(this.info["titulo"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                  SizedBox(height: 10,),
                  Text(this.info["fecha"], style: TextStyle(fontSize: 10, color: Colors.grey[600]),),
                  Expanded(child: Container(),),
                  Container(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
            
                      style: estilos.buttonStyle(oscuro: true,),
                      child: estilos.buttonChild(texto: 'Ver mas',size: 14, ph: 10, pv: 0),
                      onPressed: (){
                        Navigator.pushNamed(context, 'infodetail', arguments: this.info);
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