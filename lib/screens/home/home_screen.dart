import 'package:flutter/material.dart';
import 'package:libelulas/common/custom_drawer/custom_drawer.dart';
import 'package:libelulas/models/home.manager.dart';

import 'package:libelulas/screens/home/components/section_list.dart';
import 'package:libelulas/screens/home/components/section_staggered.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Color.fromRGBO(209, 73, 180, 0.961), 
                  Color.fromRGBO(193, 162, 214, 0.961)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                snap: true,
                floating: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text('Libelula'),
                  centerTitle: true,
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    color: Colors.white,
                    onPressed: () => Navigator.of(context).pushNamed('/cart'),
                  ),
                ],
              ),
              Consumer<HomeManager>(
                builder: (_, homeManager, __){
                  final List<Widget> children = homeManager.sections.map<Widget>(
                    (section) {
                      switch(section.type){
                        case 'List':
                          return SectionList(section);
                        case 'Staggered':
                          return SectionStaggered(section);
                        default:
                          return Container();
                      }
                    }
                  ).toList();

                  return SliverList(
                    delegate: SliverChildListDelegate(children),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}