import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Gabriel"),
            accountEmail: Text("Gabriel@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person_outline,
                size: 50,
                color: Colors.deepOrange,
              ),
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 8),
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFf45d27), Color(0xFFf5851f)]),
            ),
          )
        ],
      ),
    );
  }
}
