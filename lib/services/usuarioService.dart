import 'dart:convert';

import 'package:cbn/models/customer.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:cbn/utils/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class UsuarioService {
  final constantes = DatosConstantes();
  final prefs = PreferenciasUsuario();

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
    prefs.token = decoded["token"];
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

  Future registrarUsuario( CustomerModel customer ) async {
    final url = Uri.http(constantes.dominio, 'api/user');
    final customernuevo = jsonEncode(customer.toJson()); 
    
    final respuesta = await http.post(url,
      body:customernuevo,
      headers: {
        "Content-Type":"application/json"
      }
    );
    print(respuesta);
  }

}