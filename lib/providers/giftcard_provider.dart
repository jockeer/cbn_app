import 'package:flutter/material.dart';

class GiftCardProvider extends ChangeNotifier{

  String _montoRecarga = '10';
  String _empresaRecarga = '1';

  /*Monto Recarga*/ 
  String get montoRecarga{
    return this._montoRecarga;
  }

  set montoRecarga(String montoRecarga){
    this._montoRecarga = montoRecarga;
    notifyListeners();
  }

  /*Empresa Recarga*/ 

  String get empresaRecarga{
    return this._empresaRecarga;
  }

  set empresaRecarga(String empresaRecarga){
    this._empresaRecarga = empresaRecarga;
    notifyListeners();
  }

}