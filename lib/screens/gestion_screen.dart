import 'package:cbn/services/gestionService.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';

class GestionScreen extends StatelessWidget {
  final gestionService = GestionService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Header(
          titulo: 'Gestion Institucional',
          logo: 'gestion.png',
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: FutureBuilder(
          future: gestionService.obtenerGestion(),
          builder: (_, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        ListTile(
                          trailing: Icon(Icons.arrow_forward_ios),
                          // leading: Icon(Icons.person),
                          title: Text(
                            snapshot.data[index]["cargo"],
                          ),
                          subtitle: Text(snapshot.data[index]["nombre"]),
                          onTap: () {},
                        ),
                        Divider()
                      ],
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ))
      ],
    ));
  }
}
