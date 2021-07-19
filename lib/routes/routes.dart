import 'package:flutter/material.dart';

import 'package:cbn/screens/welcome_screen.dart';
import 'package:cbn/screens/register_page1_screen.dart';
import 'package:cbn/screens/register_page2_screen.dart';
import 'package:cbn/screens/login_screen.dart';
import 'package:cbn/screens/recover_password_screen.dart';
import 'package:cbn/screens/home_screen.dart';

Map<String, WidgetBuilder> getRoutes(){
  return <String, WidgetBuilder>{
    'welcome':(_) => WelcomeScreen(),
    'register_page1': (_)=> RegisterPage1Screen(),
    'register_page2': (_)=> RegisterPage2Screen(),
    'login': (_)=> LoginScreen(),
    'recover': (_)=> RecoverPassScreen(),
    'home': (_)=> HomeScreen(),
  };
}