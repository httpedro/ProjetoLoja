import 'package:flutter/material.dart';
import 'package:libelulas/common/custom_drawer/custom_drawer_header.dart';
import 'package:libelulas/common/custom_drawer/drawer_tile.dart';
import 'package:libelulas/models/user_manager.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 241, 188, 178),
              Colors.white,
              ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        ),
        ListView(
          children: <Widget>[
            const CustomDrawerHeader(),
            const Divider(),
            DrawerTile(
              iconData: Icons.home,
              title: 'Início',
              page: 0,
            ),
            DrawerTile(
              iconData: Icons.list,
              title: 'Produtos',
              page: 1,
            ),
            DrawerTile(
              iconData: Icons.playlist_add_check,
              title: 'Meus Pedidos',
              page: 2,
            ),
            DrawerTile(
              iconData: Icons.location_on,
              title: 'Lojas',
              page: 3,
            ),
            Consumer<UsuarioAtenticacao>(
              builder: (_, userManager, __) {
                if (userManager.adminEnabled) {
                  return Column(
                    children: <Widget>[
                      const Divider(),
                      DrawerTile(
                        iconData: Icons.settings,
                        title: 'Usuários',
                        page: 4,
                      ),
                      DrawerTile(
                        iconData: Icons.settings,
                        title: 'Pedidos',
                        page: 5,
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            )
          ],
        ),
      ],
    ));
  }
}
