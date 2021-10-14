import 'package:cbn/utils/constantes.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final colores = ColoresApp();
  final estilos = EstilosApp();
  @override
  Widget build(BuildContext context) {
    final dynamic datos = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: appBarWidget(
          titulo: datos["categoria"], centrado: true, bgColor: colores.naranja),
      body: SafeArea(
        child: Column(
          children: [
            // Header(titulo: datos["categoria"], logo: 'inbo.png'),
            Expanded(
              child: ListView(
                children: [],
              ),
            ),
            Divider(),
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
