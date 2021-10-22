import 'package:cbn/providers/providers.dart';
import 'package:cbn/services/infoService.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:cbn/widgets/fondo_pantalla.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GlosarioScreen extends StatelessWidget {
  final infoService = InfoService();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GlosarioProvider>(context);
    return Scaffold(
        body: FutureBuilder(
      future: infoService.obtenerGlosario(),
      builder: (_, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          // provider.glosarios = snapshot.data;
          return Stack(
            children: [
              FondoPantalla(img: 'fondoWhite.png'),
              Column(
                children: [
                  _Encabezado(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search),
                          hintText: 'Buscar...'),
                      onChanged: (value) {
                        if (value.isEmpty) {
                          provider.busqueda = false;
                          provider.glosarios = [];
                        } else {
                          provider.busqueda = true;
                          var nuevaLista = snapshot.data!.where((item) {
                            return (item["acronimo"]
                                    .toString()
                                    .toUpperCase()
                                    .contains(value.toUpperCase()) ||
                                item["definicion"]
                                    .toString()
                                    .toUpperCase()
                                    .contains(value.toUpperCase()));
                          }).toList();
                          provider.glosarios = nuevaLista;
                        }
                        // provider.glosarios = snapshot.data;
                        // print(provider.glosarios);
                      },
                    ),
                  ),
                  _Glosarios(
                    datos: (provider.busqueda)
                        ? provider.glosarios
                        : snapshot.data,
                  )
                ],
              )
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}

class _Glosarios extends StatelessWidget {
  final infoService = InfoService();
  final dynamic datos;

  _Glosarios({required this.datos});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.builder(
        itemCount: datos.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        width: size.width * 0.2,
                        child: Text(
                          datos[index]["acronimo"],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        )),
                    Expanded(
                      child: Container(
                        child: Text(
                          datos[index]["definicion"],
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                )),
          );
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
            Text(
              'Acrónimo',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white),
            ),
            Expanded(child: Container()),
            Text(
              'Definición',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
