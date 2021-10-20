import 'package:cbn/services/inboxService.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  final inboxservice = InboxService();
  final constantes = DatosConstantes();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              titulo: 'Inbox',
              logo: 'inbo.png',
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder(
                future: inboxservice.obtenerCategoria(),
                builder: (_, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index) {
                        return Container(
                          child: Column(
                            children: [
                              ListTile(
                                trailing: Icon(Icons.arrow_forward_ios),
                                leading: Image(
                                  image: NetworkImage(
                                      '${constantes.dominio}/uploads/inboxIcons/${snapshot.data[index]["logo"]}'),
                                  width: size.width * 0.11,
                                ),
                                title: Text(
                                  snapshot.data[index]["categoria"],
                                ),
                                onTap: () async {
                                  //final resp = await inboxservice.crearSala(snapshot.data[index]["id"]);
                                  print('s');
                                  Navigator.pushNamed(context, 'chat',
                                      arguments: snapshot.data[index]);
                                },
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
