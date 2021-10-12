import 'dart:convert';

import 'package:cbn/models/tienda.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:cbn/utils/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class TiendaService {
    final constantes = DatosConstantes();
    final prefs = PreferenciasUsuario();

    Future cargarTiendas() async {
      final url = Uri.parse('${constantes.dominio}/api/tienda');

      final respuesta = await http.get(
        url,
        headers: {
          "x-token": prefs.token
        }
      );
      final decoded = await jsonDecode(respuesta.body);
      if (!decoded["ok"]) return null;
      final tiendas = Tiendas.fromJsonList(decoded["tiendas"]);
      print(tiendas);
      return tiendas.items;
    }
}