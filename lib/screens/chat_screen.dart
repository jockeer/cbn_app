import 'package:cbn/providers/gestion_provider.dart';
import 'package:cbn/services/inboxService.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  final colores = ColoresApp();
  final estilos = EstilosApp();
  final inboxService = InboxService();
  @override
  Widget build(BuildContext context) {
    final dynamic datos = ModalRoute.of(context)?.settings.arguments;
    final provider = Provider.of<GestionProdiver>(context);
    return Scaffold(
      appBar: appBarWidget(
          titulo: datos["categoria"], centrado: true, bgColor: colores.naranja),
      body: SafeArea(
        child: Column(
          children: [
            // Header(titulo: datos["categoria"], logo: 'inbo.png'),
            Expanded(
              child: Stack(children: [
                FondoPantalla(img: 'fondoWhite.png'),
                FutureBuilder(
                    future: inboxService.obtenerMensajes(datos["id"], context),
                    builder: (_, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        final milista = snapshot.data["mensajes"];
                        //provider.mensajes = milista;
                        if (milista.length == 0) {
                          return Center(
                            child: Text('No tiene mensajes'),
                          );
                        }
                        return _Mensajeria(
                          milista: milista,
                          uid: snapshot.data["uid"],
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ]),
            ),
            // Divider(),
            Container(
              height: 60,
              width: double.infinity,
              // color: colores.naranjaClaro,
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: TextFormField(
                    decoration:
                        estilos.inputDecoration(hintText: 'Escribir...'),
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        print('ss');
                      },
                      icon: Icon(Icons.send_rounded)),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Mensajeria extends StatelessWidget {
  final List milista;
  final int uid;

  _Mensajeria({required this.milista, required this.uid});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemCount: milista.length,
      itemBuilder: (_, index) {
        return Container(
            // height: 60,
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: (uid == milista[index]["id_user"])
                ? EdgeInsets.only(top: 15, left: 50)
                : EdgeInsets.only(top: 15, right: 50),
            alignment: (uid == milista[index]["id_user"])
                ? Alignment.centerRight
                : Alignment.centerLeft,
            decoration: BoxDecoration(
                color: (uid == milista[index]["id_user"])
                    ? Colors.grey[300]
                    : Colors.black,
                borderRadius: (uid == milista[index]["id_user"])
                    ? BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))
                    : BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
            child: Container(
              // alignment: Alignment.centerLeft,
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.9),
              // color: Colors.red,
              // height: 60,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: (uid == milista[index]["id_user"])
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${milista[index]["User"]["Customer"]["name"]} ${milista[index]["User"]["Customer"]["lastname"]} ${milista[index]["User"]["Customer"]["mothername"]}',
                      style: TextStyle(
                          color: (uid == milista[index]["id_user"])
                              ? Colors.black
                              : Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      milista[index]["mensaje"] ?? "",
                      style: TextStyle(
                          color: (uid == milista[index]["id_user"])
                              ? Colors.black
                              : Colors.white,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
