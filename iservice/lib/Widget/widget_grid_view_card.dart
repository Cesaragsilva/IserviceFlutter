import 'package:flutter/material.dart';

class GridViewCard extends StatelessWidget {
  
int itemCountGrid;
Widget buildCard;
String tituloAppBar;

GridViewCard(this.itemCountGrid, this.buildCard, this.tituloAppBar);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: new AppBar(
        backgroundColor: Color(0xFFf45d27),
        title: Text("Lista de Categoria"),
      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: GridView.builder(
              itemCount: itemCountGrid,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return buildCard;
              })),
    );
  }
}