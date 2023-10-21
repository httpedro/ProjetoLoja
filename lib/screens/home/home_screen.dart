import 'package:flutter/material.dart';
import 'package:libelulas/common/custom_drawer/custom_drawer.dart';
import 'package:libelulas/components/section_staggered.dart'
import 'package:libelulas/models/home_manager.dart';

class HomeScreen extends StatelessWidget{
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
                                    Color.fromARGB(255, 211, 118, 130),
                                    Color.fromARGB(255, 253, 181, 168)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter
                            )
                        ),
                    ),
                ]
            )
            CustomScrollView(
                slivers: <Widget>[
                    SliverAppBar(
                        snap: true,
                        floating: true,
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        flexibleSpace: const FlexibleSpaceBar(
                            title: Text('Líbelula Store'),
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
                        builder: (_, HomeManager, __){
                            final List<Widget> children = HomeManager.section.map<Widget>(
                                (section) {
                                    switch(section.type){
                                        case 'List':
                                            return SectionList(section);
                                        case 'Staggered':
                                            return Container(SectionStaggered(section));
                                        default:
                                            return Container();

                                    }
                                }
                            ).toList();
                            return SliverList(
                                delegate: SliverChildListDelegate(),
                            );
                        }
                    )
                ],
            ),
        );
    }
}                    