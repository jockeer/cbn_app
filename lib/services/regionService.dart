import 'dart:convert';

import 'package:cbn/models/region.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:http/http.dart' as http;

class RegionService {
  final datosConstantes = DatosConstantes();
  Future<List<Region>> obtenerRegiones() async {
    final url = Uri.parse('${datosConstantes.dominio}/api/region');
    final resp = await http.get(url);

    final respDecoded = await jsonDecode(resp.body);
    final regiones = Regiones.fromJsonList(respDecoded["regiones"]);
    return regiones.items;
  }
}
