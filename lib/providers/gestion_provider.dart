import 'package:flutter/material.dart';

class GestionProdiver extends ChangeNotifier {
  bool _showOrganigrama = false;

  bool get showOrganigrama {
    return this._showOrganigrama;
  }

  set showOrganigrama(bool showOrganigrama) {
    this._showOrganigrama = showOrganigrama;
    notifyListeners();
  }
}
