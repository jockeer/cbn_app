import 'dart:io';

import 'package:flutter/material.dart';

class RegistroProvider extends ChangeNotifier{

  File? foto;

  String _pin = '';

  String _email = '';

  String _birthday = '';
  String _legajo = '';
  String _ci = '';

  String get legajo{
    return this._legajo;
  }

  set legajo(String legajo){
    this._legajo = legajo;
    notifyListeners();
  }
  String get ci{
    return this._ci;
  }

  set ci(String ci){
    this._ci = ci;
    notifyListeners();
  }
  String get birthday{
    return this._birthday;
  }

  set birthday(String birthday){
    this._birthday = birthday;
    notifyListeners();
  }

  String get email{
    return this._email;
  }

  set email(String email){
    this._email = email;
    notifyListeners();
  }
  String get pin{
    return this._pin;
  }

  set pin(String pin){
    this._pin = pin;
    notifyListeners();
  }

  void updateSelectedFoto(String path){
    this.foto = File.fromUri(Uri(path: path));
    notifyListeners();
  }
}