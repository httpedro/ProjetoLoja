import 'package:flutter/material.dart';
import 'package:libelulas/models/user_maneger.dart';
import 'package:provider/provider.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 24, 16, 8),
      height: 180,
      child: Consumer<UsuarioAtenticacao>(
        builder: (_, usuarioAtenticacao, __){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text(
                'Libelula\nStore',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Olá, ${usuarioAtenticacao.user?.name ?? ''}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: (){
                  if(usuarioAtenticacao.isLoggedIn){
                    usuarioAtenticacao.signOut();
                  } else {
                    Navigator.of(context).pushNamed('/login');
                  }
                },
                child: Text(
                  usuarioAtenticacao.isLoggedIn
                    ? 'Sair'
                    : 'Entre ou cadastra-se >',
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ), 
                ),
              )
            ],
          );
        }
      )
    );
  }
}