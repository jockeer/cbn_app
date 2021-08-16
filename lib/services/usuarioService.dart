import 'dart:convert';

import 'package:cbn/models/customer.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:http/http.dart' as http;

class UsuarioService {
  final constantes = DatosConstantes();

  Future login({required String legajo,required String ci }) async {
    final url = Uri.http(constantes.dominio, 'api/auth/login');
    final parametros = {
        "legajo":legajo,
        "ci":ci
    };
    final respuesta = await http.post(
      url,
      body: jsonEncode(parametros),
      headers: {
        "Content-Type":"application/json"
      }
    );
    final decoded = await json.decode(respuesta.body);
    if (!decoded["ok"]) return null;
    return decoded;
  }

  Future obtenerUsuarios({required String legajo,required String ci }) async {
    final url = Uri.http(constantes.dominio, 'api/customer/$legajo/$ci');
    final respuesta = await http.get(url);
    final decoded = await json.decode(respuesta.body);
    if (!decoded["ok"]) return null;
    final customer = CustomerModel.fromJson(decoded["data"]); 
    return customer;
  }

  Future registrarUsuario() async {
    
  }

}