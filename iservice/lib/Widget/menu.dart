import 'package:flutter/material.dart';
import 'package:todo/pages/cadastro_servico.dart';
import 'package:todo/pages/cadastro_usuario.dart';
import 'package:todo/utilidades/styles.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: <Widget>[
              buildUserAccountsDrawerHeader(),
              buildItensMenu("Dados Usuário", false, Icons.account_circle, () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CadastroUsuario(
                          telaCadastro: false,
                        )));
              }),
              buildItensMenu("Meu Serviços", false, Icons.store, () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CadastroServico()));
              }),
            ],
          ),
        ),
      ),
    );
  }

  buildItensMenu(
      String texto, bool selected, IconData icone, Function comportamento) {
    return ListTileTheme(
      selectedColor: Colors.deepOrange,
      child: ListTile(
        selected: selected,
        onTap: comportamento,
        leading: Icon(
          icone,
          size: 25,
          color: Colors.grey,
        ),
        title: Text(
          texto,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text("Gabriel"),
      accountEmail: Text("Gabriel@gmail.com"),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.person_outline,
          size: 50,
          color: Colors.grey,
        ),
      ),
      decoration: boxDecorationLaranjaDegrade,
    );
  }
}
