import 'dart:convert';

import 'package:cbn/utils/constantes.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Sucursal sucursalModelFromJson(String str) => Sucursal.fromJson(json.decode(str));

String sucursalModelToJson(Sucursal data) => json.encode(data.toJson());

class Sucursales{
  List<Sucursal> sucursales = [];
  Set<Marker> markers = new Set<Marker>();

  Sucursales.fromJsonList(List<dynamic> jsonList, BuildContext context){
    final size = MediaQuery.of(context).size;
    final estilos = EstilosApp();
    // if (jsonList==null) {
    //   return;
    // }
    jsonList.forEach((item) {
      final sucursal = Sucursal.fromJson(item);
      markers.add(new Marker(
      markerId: MarkerId('geo-location-${sucursal.id}'),
      position: LatLng(sucursal.lat!, sucursal.lng!),
      onTap: (){
        showModalBottomSheet(context: context, backgroundColor: Colors.transparent, builder: (context){
          return ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: Container(
              padding: EdgeInsets.all(30),
              height: size.height*0.4,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(sucursal.tienda!, style: TextStyle( fontSize: size.width*0.06, fontWeight: FontWeight.bold ),),
                  SizedBox(height: 10,),
                  Text(sucursal.address!, style: TextStyle( fontSize: size.width*0.03),),
                  SizedBox(height: 10,),
                  Text('Sucursal Autorizada', style: TextStyle( fontSize: size.width*0.04, fontWeight: FontWeight.bold ),),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          child: estilos.buttonChild(texto: 'Ruta'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      SizedBox(width: 40,),
                      Expanded(
                        child: ElevatedButton(
                          style: estilos.buttonStyle(oscuro: true),
                          child: estilos.buttonChild(texto: 'Cupones'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          );
        });
      }
    ));
      sucursales.add(sucursal);
    });
  }
}

class Sucursal {
    Sucursal({
        this.id,
        this.idTienda,
        this.lat,
        this.lng,
        this.address,
        this.logo,
        this.tienda
    });

    int ?id;
    int ?idTienda;
    double ?lat;
    double ?lng;
    String ?address;
    String ?logo;
    String ?tienda;


    factory Sucursal.fromJson(Map<String, dynamic> json) => Sucursal(
        id: json["id"],
        idTienda: json["id_tienda"],
        lat: json["lat"],
        lng: json["lng"],
        address: json["address"],
        logo: json["Tienda"]["logo"],
        tienda: json["Tienda"]["name"],
    );

    Map<String, dynamic> toJson() => {
        
    };
}
