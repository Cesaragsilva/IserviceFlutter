import 'package:flutter/material.dart';

class TextoFinalTelaLink extends StatelessWidget {
  Function navegacao;
  String textoSemLink;
  String textoNavegacao;

  TextoFinalTelaLink(this.navegacao, this.textoSemLink, this.textoNavegacao);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navegacao,
      child: Align(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: textoSemLink,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: textoNavegacao,
                style: TextStyle(
                  color: Color(0xFFf5851f),
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
