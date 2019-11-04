import 'package:flutter/material.dart';

class CampoPesquisa extends StatefulWidget {
  Function pesquisar;

  CampoPesquisa(this.pesquisar);

  @override
  _CampoPesquisaState createState() => _CampoPesquisaState();
}

class _CampoPesquisaState extends State<CampoPesquisa> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.height / 2.2,
        height: 45,
        padding: EdgeInsets.only(top: 5, left: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 8),
            ]),
        child: Theme(
          child: TextField(
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 15.0),
            decoration: InputDecoration(
                hintText: 'O que você precisa?',
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Icon(Icons.search),
                ),
                border: InputBorder.none),
            onChanged: widget.pesquisar,
          ),
          data: Theme.of(context).copyWith(primaryColor: Color(0xFFf5851f)),
        ));
  }
}
