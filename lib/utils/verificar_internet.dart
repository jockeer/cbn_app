import 'dart:io';

Future<bool> comprobarInternet() async {
  try {
    final result = await InternetAddress.lookup('www.google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('conectado a internet');
      return true;
    }
    return false;
  } on SocketException catch (_) {
    print('sin conexion a internet');
    return false;
  }
}