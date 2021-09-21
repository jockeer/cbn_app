import 'package:cbn/utils/constantes.dart';
import 'package:flutter/material.dart';

class CustomNavigatorBar extends StatelessWidget {
  final colores = ColoresApp();

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white,
      unselectedLabelStyle: TextStyle(color: Colors.white),
      selectedItemColor: colores.naranja,
      selectedIconTheme: IconThemeData(color: colores.naranja),
      showUnselectedLabels: true,
      onTap: (int i){
        print(i);
      },
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(icon: Image(image: AssetImage('assets/icons/user.png'), width: 25,), label: 'Perfil'),
        BottomNavigationBarItem(icon: Image(image: AssetImage('assets/icons/glosario.png'), width: 25,), label: 'Glosario'),
        BottomNavigationBarItem(icon: Image(image: AssetImage('assets/icons/beneficios.png'), width: 25,), label: 'Beneficios'),
        BottomNavigationBarItem(icon: Image(image: AssetImage('assets/icons/megafono.png'), width: 25,), label: 'CBN'),
        BottomNavigationBarItem(icon: Image(image: AssetImage('assets/icons/gestion.png'), width: 25,), label: 'Gestion Institucional'),
        BottomNavigationBarItem(icon: Image(image: AssetImage('assets/icons/inbo.png'), width: 25,), label: 'Inbox'),
        BottomNavigationBarItem(icon: Image(image: AssetImage('assets/icons/calculadora.png'), width: 25,), label: 'IVA'),
      ],
    );
  }
}