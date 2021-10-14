import 'dart:convert';

import 'package:cbn/utils/constantes.dart';
import 'package:cbn/utils/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class InboxService {
  final datosConstantes = DatosConstantes();
  final prefs = PreferenciasUsuario();

  Future obtenerCategoria() async {
    final url =
        Uri.parse('${datosConstantes.dominio}/api/mensajeria/categorias');
    final resp = await http.get(url, headers: {'x-token': prefs.token});

    final respDecoded = await jsonDecode(resp.body);
    return respDecoded["resp"];
  }
}
