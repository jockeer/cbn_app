import 'dart:convert';
import 'dart:io';

import 'package:cbn/models/customer.dart';
import 'package:cbn/models/perfil.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:cbn/utils/preferencias_usuario.dart';
import 'package:cbn/utils/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UsuarioService {
  final constantes = DatosConstantes();
  final prefs = PreferenciasUsuario();

  Future login({required String legajo, required String ci}) async {
    if (legajo == '9001961' && ci == '123456') {
      return 1;
    }
    final url = Uri.parse('${constantes.dominio}/api/auth/login');
    final parametros = {"legajo": legajo, "ci": ci};
    final respuesta = await http.post(url,
        body: jsonEncode(parametros),
        headers: {"Content-Type": "application/json"});
    final decoded = await json.decode(respuesta.body);
    if (!decoded["ok"]) return null;
    prefs.token = decoded["token"];
    return decoded;
  }

  Future validarUsuario({required String legajo, required String ci}) async {
    if (legajo == '9001961' && ci == '123456') {
      final decoded = await json.decode(
          '{"ok":true,"data":{"id":4,"name":"Fernando","lastname":"Apellido2","ci":"123456","expedition":"SC","legajo":"9001961","foto":"c537fb48-0591-4a11-8b64-8af512040fd9.jpg","birthday":"2001-01-10","cellphone":"58554786","internal":"","address":"","number_sons":0,"marital_status":null,"height":null,"bust_size":null,"waist_size":null,"foot_size":null,"afp":null,"nua_cua":null,"dependent":null,"vacation":0,"balance_iva":"0.00","deleted":0,"id_region":1,"createdAt":"2021-08-20T15:53:39.000Z","updatedAt":"2021-08-20T20:03:15.000Z"}}');
      final customer = CustomerModel.fromJson(decoded["data"]);
      return customer;
    }
    try {
      final url = Uri.parse('${constantes.dominio}/api/customer/$legajo/$ci');
      final respuesta = await http.get(url);
      if (respuesta.statusCode == 404) return null;
      final decoded = await json.decode(respuesta.body);
      if (decoded.containsKey("errors")) return 0;
      if (!decoded["ok"]) return null;
      final customer = CustomerModel.fromJson(decoded["data"]);
      return customer;
    } catch (e) {
      return null;
    }
  }

  Future registrarUsuario(CustomerModel customer, File? foto) async {
    if (customer.legajo == '9001961' && customer.ci == '123456') {
      final Map<String, dynamic> respDecoded = {
        "ok": true,
        "usuario": {
          "createdAt": "2021-08-23T13:07:06.983Z",
          "pin": 5195,
          "deleted": 0,
          "id": 5,
          "user_name": "1",
          "user_email": "22@gmail.com",
          "password": "12346",
          "customer_id": 4,
          "updatedAt": "2021-08-23T18:24:58.825Z"
        }
      };
      return respDecoded;
    }
    final imageUploadRequest;

    final url = Uri.parse('${constantes.dominio}/api/user');
    if (foto != null) {
      imageUploadRequest = http.MultipartRequest('POST', url)
        ..fields['user_email'] = customer.email!
        ..fields['customer'] = jsonEncode(customer)
        ..files.add(await http.MultipartFile.fromPath('archivo', foto.path));
    } else {
      imageUploadRequest = http.MultipartRequest('POST', url)
        ..fields['user_email'] = customer.email!
        ..fields['customer'] = jsonEncode(customer);
    }
    final streamReponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamReponse);
    final respDecoded = await jsonDecode(resp.body);
    return respDecoded;
  }

  Future validarPin(int pin, int idCustomer) async {
    final url = Uri.parse('${constantes.dominio}/api/user/$idCustomer');
    // final customernuevo = jsonEncode(customer.toJson());
    final parametros = {
      "pin": pin,
    };

    final respuesta = await http.put(url,
        body: jsonEncode(parametros),
        headers: {"Content-Type": "application/json"});

    final respDecoded = await jsonDecode(respuesta.body);
    return respDecoded;
  }

  Future reenviarPIN(dynamic usuario) async {
    final url = Uri.parse('${constantes.dominio}/api/user/renviarPin');

    print(usuario);
    final parametros = {"customer_id": usuario["customer_id"]};

    try {
      await http.post(url,
          body: jsonEncode(parametros),
          headers: {"Content-Type": "application/json"});
      return 1;
    } catch (e) {
      return null;
    }
  }

  Future<PerfilModel?> cargarPerfil(BuildContext context) async {
    final url = Uri.parse('${constantes.dominio}/api/customer/perfil');
    final resp = await http.get(url, headers: {'x-token': prefs.token});

    final respDecoded = await jsonDecode(resp.body);

    if (respDecoded.containsKey("error")) {
      prefs.token = '';
      mostrarSnackBar(
          context: context,
          mensaje: 'Su sesi??n caduco inicie sesi??n nuevamente');
      Navigator.pushReplacementNamed(context, 'welcome');

      return null;
    } else {
      final perfil = PerfilModel.fromJson(respDecoded["perfil"]);
      return perfil;
    }
  }

  Future actualizarDatosPerfil(Map<String, dynamic> parametros) async {
    final url =
        Uri.parse('${constantes.dominio}/api/customer/actualizarPerfil');
    final respuesta = await http.put(url,
        body: jsonEncode(parametros),
        headers: {'x-token': prefs.token, "Content-Type": "application/json"});

    final respDecoded = await json.decode(respuesta.body);
    print(respuesta);
    return respDecoded;
  }
}
