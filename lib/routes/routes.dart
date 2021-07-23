import 'package:cbn/screens/recarga_gift_card_screen.dart';
import 'package:flutter/material.dart';

import 'package:cbn/screens/welcome_screen.dart';
import 'package:cbn/screens/register_page1_screen.dart';
import 'package:cbn/screens/register_page2_screen.dart';
import 'package:cbn/screens/login_screen.dart';
import 'package:cbn/screens/recover_password_screen.dart';
import 'package:cbn/screens/home_screen.dart';
import 'package:cbn/screens/detail_cuenta_screen.dart';
import 'package:cbn/screens/cupon_giftcard_screen.dart';
import 'package:cbn/screens/gift_card_screen.dart';
import 'package:cbn/screens/tiendas_afiliadas_screen.dart';
import 'package:cbn/screens/cupones_screen.dart';

Map<String, WidgetBuilder> getRoutes(){
  return <String, WidgetBuilder>{
    'welcome':(_) => WelcomeScreen(),
    'register_page1': (_)=> RegisterPage1Screen(),
    'register_page2': (_)=> RegisterPage2Screen(),
    'login': (_)=> LoginScreen(),
    'recover': (_)=> RecoverPassScreen(),
    'home': (_)=> HomeScreen(),
    'detail_cuenta' : (_)=> DetailCuentaScreen(),
    'cupon_gifcard' : (_)=> CuponGiftcardScreen(),
    'tu_gift_card' : (_)=> GiftCardScreen(),
    'tiendas_afiliadas' : (_)=> TiendasAfiliadasScreen(),
    'cupones' : (_)=> CuponesScreen(),
    'recarga_gift_card' : (_)=> RecargaGiftCardScreen(),

  };
}