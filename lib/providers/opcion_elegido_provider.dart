import 'package:flutter/material.dart';

class OpcionElegidaProvider extends ChangeNotifier{

  late String _user;
  late String _password;

  String get user{
    return this._user;
  }
  set user(String user){
    this._user = user;
    notifyListeners();
  }
  
  String get password{
    return this._password;
  }
  set password(String password){
    this._password = password;
    notifyListeners();
  }

}