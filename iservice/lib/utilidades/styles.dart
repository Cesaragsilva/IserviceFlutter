import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  color: Colors.deepOrange,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.deepOrange,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final boxDecorationLaranjaDegradeIs = BoxDecoration(
    boxShadow: [
      BoxShadow(color: Colors.black87, blurRadius: 8),
    ],
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFf45d27), Color(0xFFf5851f)]));

final boxDecorationLaranjaDegrade = BoxDecoration(
  boxShadow: [
    BoxShadow(color: Colors.black26, blurRadius: 8),
  ],
  gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomCenter,
      colors: [Color(0xFFf45d27), Color(0xFFf5851f)]),
);
