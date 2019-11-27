import 'package:flutter/material.dart';
import 'package:todo/pages/pagina_inicial.dart';
import 'Pages/login.dart';
import 'Pages/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFFf5851f)),
      home: new SplashPage(),
      routes: {
        '/login': (context) => new Login(),
        '/PaginaInicial': (context) => new PaginaInicial(),
      },
    );
  }
}
