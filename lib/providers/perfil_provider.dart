import 'package:flutter/material.dart';

class PerfilProvider extends ChangeNotifier {
  bool _editPerfil = false;
  int _idpolera = 1;
  int _idpantalon = 32;
  int _idzapato = 35;
  int _idEscolaridad = 1;
  String _estadoCivil = 'S';
  late String _telefono;
  late String _interno;
  late String _correo;
  late String _direccion;
  late String _estatura;

  bool get editPerfil {
    return this._editPerfil;
  }

  set editPerfil(bool editPerfil) {
    this._editPerfil = editPerfil;
    notifyListeners();
  }

  String get telefono {
    return this._telefono;
  }

  set telefono(String telefono) {
    this._telefono = telefono;
    notifyListeners();
  }

  String get estatura {
    return this._estatura;
  }

  set estatura(String estatura) {
    this._estatura = estatura;
    notifyListeners();
  }

  String get correo {
    return this._correo;
  }

  set correo(String correo) {
    this._correo = correo;
    notifyListeners();
  }

  String get direccion {
    return this._direccion;
  }

  set direccion(String direccion) {
    this._direccion = direccion;
    notifyListeners();
  }

  String get interno {
    return this._interno;
  }

  set interno(String interno) {
    this._interno = interno;
    notifyListeners();
  }

  int get idpantalon {
    return this._idpantalon;
  }

  set idpantalon(int idpantalon) {
    this._idpantalon = idpantalon;
    notifyListeners();
  }

  String get estadoCivil {
    return this._estadoCivil;
  }

  set estadoCivil(String estadoCivil) {
    this._estadoCivil = estadoCivil;
    notifyListeners();
  }

  int get idzapato {
    return this._idzapato;
  }

  set idzapato(int idzapato) {
    this._idzapato = idzapato;
    notifyListeners();
  }

  int get idpolera {
    return this._idpolera;
  }

  set idpolera(int idpolera) {
    this._idpolera = idpolera;
    notifyListeners();
  }

  int get idEscolaridad {
    return this._idEscolaridad;
  }

  set idEscolaridad(int idEscolaridad) {
    this._idEscolaridad = idEscolaridad;
    notifyListeners();
  }
}
