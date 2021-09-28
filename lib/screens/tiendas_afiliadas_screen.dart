import 'dart:async';

import 'package:cbn/services/sucursalService.dart';
import 'package:flutter/material.dart';

import 'package:cbn/widgets/widgets.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class TiendasAfiliadasScreen extends StatefulWidget {

  @override
  _TiendasAfiliadasScreenState createState() => _TiendasAfiliadasScreenState();
}

class _TiendasAfiliadasScreenState extends State<TiendasAfiliadasScreen> {
  Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-17.767788, -63.200318),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    final sucursalService = SucursalService();
    return Scaffold(
      body: Column(
        children: [
          Header(titulo: 'Tiendas afilidas', logo: 'beneficios.png',),
          Expanded(
            child: FutureBuilder(
              future: sucursalService.cargarSucursales(context),
              builder: ( _ , AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: snapshot.data,
                  );
                }
                return Center(child: CircularProgressIndicator(),);
              },
            ),
          ),
        ],
      ) 
      
      
    );
  }
}