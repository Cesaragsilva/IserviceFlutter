import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  double tamanhoIs;
  double paddingIs;

  Logo(this.tamanhoIs, this.paddingIs);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.white),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Text(
          "IS",
          style: TextStyle(fontSize: tamanhoIs, color: Colors.white),
        ),
      ),
    );
  }
}
