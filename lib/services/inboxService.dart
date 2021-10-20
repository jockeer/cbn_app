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

  Future crearSala(int idCategoria) async {
    final url =
        Uri.parse('${datosConstantes.dominio}/api/mensajeria/crearSala');

    try {
      final resp = await http.post(url,
          body: jsonEncode({"id_categoria": idCategoria}),
          headers: {
            'x-token': prefs.token,
            "Content-Type": "application/json"
          });
      return null;
    } catch (e) {
      return null;
    }
  }
}
