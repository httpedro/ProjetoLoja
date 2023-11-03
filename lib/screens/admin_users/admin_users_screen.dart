import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libelulas/common/custom_drawer/custom_drawer.dart';
import 'package:libelulas/models/admin_users_manager.dart';
import 'package:provider/provider.dart';

class AdminUsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GoogleFonts.carroisGothic();
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Usuários'),
        centerTitle: true,
      ),
      body: Consumer<AdminUsersManager>(
        builder: (_, adminUsersManager, __) {
          return AlphabetListScrollView(
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(
                  adminUsersManager.users[index].name as String,
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.black),
                ),
                subtitle: Text(
                  adminUsersManager.users[index].email as String,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              );
            },
            highlightTextStyle: TextStyle(color: Colors.black, fontSize: 20),
            indexedHeight: (index) => 80,
            strList: adminUsersManager.names,
            showPreview: true,
          );
        },
      ),
    );
  }
}
