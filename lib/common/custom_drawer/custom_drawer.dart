import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:libelulas/common/custom_drawer/custom_drawer_header.dart';
import 'package:libelulas/common/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Color.fromARGB(255, 255, 87, 238)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
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
              Consumer:<UserManager>(
                builder: (_, UserManager, __){
                  if(userManager.adminEnabled){
                    return Column(
                      children: <Widget>[
                        const Divider(),
                        DrawerTile(
                          iconData: Icons.settins,
                          title: 'Usuários',
                          page: 4,
                        ),
                        DrawerTile(
                          iconData: Icons.settings,
                          title: 'Pedidos',
                          page: 5,
                        ),
                      ]
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ],
      )
    );
  }
}
