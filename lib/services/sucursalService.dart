import 'dart:convert';

import 'package:cbn/models/sucursal.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:cbn/utils/preferencias_usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SucursalService{
  final constantes = DatosConstantes();
  final prefs = PreferenciasUsuario();

  Future cargarSucursales (BuildContext context) async {
    final url = Uri.http(constantes.dominio, 'api/sucursal');

    final respuesta = await http.get(url);

    final decodedData = json.decode(respuesta.body);
    final resp  = new Sucursales.fromJsonList(decodedData["sucursales"], context);
    print(decodedData);
    return resp.markers;
  }
}