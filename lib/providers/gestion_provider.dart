import 'package:flutter/material.dart';

class GestionProdiver extends ChangeNotifier {
  bool _showOrganigrama = false;

  List _mensajes = [];

  bool get showOrganigrama {
    return this._showOrganigrama;
  }

  set showOrganigrama(bool showOrganigrama) {
    this._showOrganigrama = showOrganigrama;
    notifyListeners();
  }

  List get mensajes {
    return this._mensajes;
  }

  set mensajes(List mensajes) {
    this._mensajes = mensajes;
    notifyListeners();
  }
}
