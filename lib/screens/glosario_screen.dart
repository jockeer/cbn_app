import 'package:cbn/services/infoService.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';

class GlosarioScreen extends StatelessWidget {

  final infoService = InfoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(titulo: 'Glosario',centrado: true),
      body: SafeArea(
        child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  children: [
                    Text('Acronimo', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 16 ) ,),
                    Expanded(child: Container()),
                    Text('Definicion', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 16 ) ,),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              Expanded(
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
                                color: (index % 2 == 0)? Colors.grey[400] : Colors.grey[200],
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(snapshot.data[index]["acronimo"], style: TextStyle( fontWeight: FontWeight.bold, fontSize: 14 ),),
                                    Text(snapshot.data[index]["definicion"], style: TextStyle( fontSize: 14 ),),
                                  ],
                                )
                              ),
                              // child: ListTile(
                              //   tileColor: (index % 2 == 0)? Colors.grey[400] : Colors.grey[200],
                              //   title: Text(snapshot.data[index]["acronimo"] ),
                              //   trailing: Text(snapshot.data[index]["definicion"]),
                              // ),
                            );
                          },
                        );
                      }
                      return Center(child: CircularProgressIndicator(),);
                    },
                  ),
              ),
            ],
          ),
        
      ),
    );
  }
}