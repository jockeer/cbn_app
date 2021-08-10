import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario { 
  
  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();


  factory PreferenciasUsuario(){
    return _instancia;
  }

  PreferenciasUsuario._internal();

  late SharedPreferences prefs;

  initPrefs() async {
    this.prefs = await SharedPreferences.getInstance();
  }

  int get inbox{
    return prefs.getInt('inbox') ?? 0;
  }

  set inbox(int cantidad){
    prefs.setInt('inbox', cantidad);
  }


}