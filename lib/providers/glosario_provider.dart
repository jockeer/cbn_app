import 'package:flutter/material.dart';

class GlosarioProvider extends ChangeNotifier {
  bool _busqueda = false;

  List _glosarios = [];

  bool get busqueda {
    return this._busqueda;
  }

  set busqueda(bool busqueda) {
    this._busqueda = busqueda;
    notifyListeners();
  }

  List get glosarios {
    return this._glosarios;
  }

  set glosarios(List glosarios) {
    this._glosarios = glosarios;
    notifyListeners();
  }
}
