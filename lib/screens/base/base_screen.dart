import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libelulas/common/custom_drawer/custom_drawer.dart';
import 'package:libelulas/models/page_manager.dart';
import 'package:libelulas/models/user_manager.dart';
import 'package:libelulas/screens/admin_users/admin_users_screen.dart';
import 'package:libelulas/screens/home/home_screen.dart';
import 'package:libelulas/screens/products/products_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GoogleFonts.carroisGothic();
    return Provider(
      create: (_) => PageManager(pageController),
      child: Consumer<UsuarioAtenticacao>(
        builder: (_, userManager, __) {
          return PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              ProductsScreen(),
              Scaffold(
                drawer: CustomDrawer(),
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  title: const Text('Meus pedidos'),
                  centerTitle: true,
                ),
              ),
              Scaffold(
                drawer: const CustomDrawer(),
                appBar: AppBar(
                  backgroundColor: Color.fromARGB(0, 255, 255, 255),
                  title: const Text('Lojas'),
                  centerTitle: true,
                ),
              ),
              if (userManager.adminEnabled) ...[
                AdminUsersScreen(),
                Scaffold(
                  drawer: CustomDrawer(),
                  appBar: AppBar(
                    backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                    title: const Text('Pedidos'),
                    centerTitle: true,
                  ),
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}
