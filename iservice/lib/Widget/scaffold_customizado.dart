import 'package:flutter/material.dart';

import 'menu.dart';

class ScaffoldCustomizado extends StatefulWidget {
  Column corpo;

  ScaffoldCustomizado(this.corpo);

  @override
  _ScaffoldCustomizadoState createState() => _ScaffoldCustomizadoState();
}

class _ScaffoldCustomizadoState extends State<ScaffoldCustomizado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      body: Stack(
        children: <Widget>[
          widget.corpo,
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
          ),
        ],
      ),
    );
  }
}
