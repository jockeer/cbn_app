import 'dart:io';

import 'package:flutter/material.dart';

class RegistroProvider extends ChangeNotifier{

  File? foto;

  void updateSelectedFoto(String path){
    this.foto = File.fromUri(Uri(path: path));
    notifyListeners();
  }
}