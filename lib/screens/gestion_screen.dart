import 'package:cbn/services/infoService.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';


class GestionScreen extends StatelessWidget {

  final infoService = InfoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(titulo: 'Gestion Institucional',logo: 'gestion.png',),
            Expanded(child: ListView())
          ],
        )
      ),
    );
  }
}