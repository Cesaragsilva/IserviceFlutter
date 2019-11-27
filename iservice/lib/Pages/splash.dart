import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:todo/Widget/logo.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  SplashPageState() {
    var _timer = new Timer(const Duration(milliseconds: 200), () {
      setState(() {
        animacao();
      });
    });
  }

  void navigationToNextPage() {
    Navigator.pushReplacementNamed(context, '/PaginaInicial');
  }

  var _height = 0.0;
  var _width = 0.0;

  animacao() async {
    setState(() {
      _height = 150.0;
      _width = 150.0;
    });
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);R
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFf45d27), Color(0xFFf5851f)])),
        ),
        Center(child: buildLogo(context, 100.0))
      ],
    ));
  }

  buildLogo(BuildContext context, tamanhoIs) {
    return GestureDetector(
      onTap: () {
        animacao();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOutExpo,
        height: _height,
        width: _width,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.white),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            "IS",
            style: TextStyle(fontSize: tamanhoIs, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
