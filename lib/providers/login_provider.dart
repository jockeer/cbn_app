import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{

  late String _user;
  late String _password;

  int _index = 0;

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

  int get index{
    return this._index;
  }
  set index(int index){
    this._index = index;
    notifyListeners();
  }

}