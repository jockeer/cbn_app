import 'package:cbn/services/gestionService.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class OrganigramaScreen extends StatelessWidget {
  final gestionService = GestionService();
  final constantes = DatosConstantes();
  @override
  Widget build(BuildContext context) {
    final dynamic datos = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              titulo: 'Gestion Institucional',
              logo: 'gestion.png',
            ),
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back)),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: PhotoView(
                backgroundDecoration: BoxDecoration(color: Colors.white),
                minScale: 0.8,
                initialScale: 1.0,
                loadingBuilder: (context, event) => Center(
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator(),
                  ),
                ),
                imageProvider: NetworkImage(
                    '${constantes.dominio}/uploads/organigrama/${datos["foto"]}'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
