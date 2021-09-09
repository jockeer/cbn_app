import 'dart:convert';

import 'package:cbn/utils/constantes.dart';
import 'package:cbn/utils/preferencias_usuario.dart';
import 'package:http/http.dart' as http;


class InfoService {
  final datosConstantes = DatosConstantes();  
  final prefs = PreferenciasUsuario();
  Future obtenerInformacion () async{

    final url = Uri.parse('${datosConstantes.dominio}/api/informacion');
    final resp = await http.get(url,
      headers: {
        'x-token': prefs.token
      }
    );

    final respDecoded = await jsonDecode(resp.body);
    return respDecoded["info"];
  }

  Future obtenerGlosario () async{

    final url = Uri.parse('${datosConstantes.dominio}/api/glosarios');
    final resp = await http.get(url,
      headers: {
        'x-token': prefs.token
      }
    );

    final respDecoded = await jsonDecode(resp.body);
    return respDecoded["glosarios"];
  }
}