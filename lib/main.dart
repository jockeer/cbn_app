import 'package:cbn/providers/registro_provider.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:cbn/utils/preferencias_usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:cbn/routes/routes.dart';
import 'package:cbn/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final colores = ColoresApp();
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GiftCardProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RegistroProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GlosarioProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GestionProdiver(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: (prefs.token == '') ? 'welcome' : 'home',
        routes: getRoutes(),
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
          ),
          canvasColor: Colors.black,
        ),
      ),
    );
  }
}
