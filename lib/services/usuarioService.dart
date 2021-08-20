import 'dart:convert';
import 'dart:io';

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
    if(respuesta.statusCode==404) return null;
    final decoded = await json.decode(respuesta.body);
    if (!decoded["ok"]) return null;
    final customer = CustomerModel.fromJson(decoded["data"]); 
    return customer;
  }

  Future registrarUsuario( CustomerModel customer, File foto ) async {

    final url = Uri.http(constantes.dominio, 'api/user');
    
    final imageUploadRequest = http.MultipartRequest('POST',url)
    ..fields['user_email'] = customer.email!
    ..fields['customer'] = jsonEncode(customer) 
    ..files.add(await http.MultipartFile.fromPath('archivo', foto.path));
    final streamReponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamReponse);
    final respDecoded = await jsonDecode(resp.body);
    return respDecoded;
  }

  Future validarPin( int pin, int idCustomer ) async {
    final url = Uri.http(constantes.dominio, 'api/user/$idCustomer');
    // final customernuevo = jsonEncode(customer.toJson()); 
    final parametros = {
      "pin":pin,
    };
    
    
    final respuesta = await http.put(url,
      body:jsonEncode(parametros),
      headers: {
        "Content-Type":"application/json"
      }
    );

    final respDecoded = await jsonDecode(respuesta.body);
    return respDecoded;
  }

}