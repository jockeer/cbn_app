
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


import 'package:cbn/routes/routes.dart';
import 'package:cbn/providers/providers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      )
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) =>LoginProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'welcome',
        routes:getRoutes(),
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0
          )
        ),
      ),
    );
  }
}