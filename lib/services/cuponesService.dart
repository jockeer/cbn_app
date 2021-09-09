

import 'dart:convert';

import 'package:cbn/utils/constantes.dart';
import 'package:cbn/utils/preferencias_usuario.dart';
import 'package:http/http.dart' as http;
class CuponesService{

  final constantes = DatosConstantes();
  final prefs = PreferenciasUsuario();

  Future obtenerCuponesCat () async {
    List categorias = [];
    final url = Uri.parse('${constantes.dominio}/api/cupones/cuponCategoria');

    final resp = await http.get(url,
    headers: {
      'x-token': prefs.token
    });

    final respDecoded = await jsonDecode(resp.body);
   // print(respDecoded["data"]);
    await respDecoded["data"].forEach((key, value){
      categorias.add(key);
      // print(key);
    });
    return {
      "data": respDecoded["data"],
      "categorias": categorias
    };
  }
}