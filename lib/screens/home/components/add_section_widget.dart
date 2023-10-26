import 'package:flutter/material.dart';
import 'package:libelulas/models/home.manager.dart';
import 'package:libelulas/models/section.dart';

class AddSectionWidget extends StatelessWidget {

  const AddSectionWidget(this.homeManager);

  final HomeManager homeManager;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ElevatedButton(
            onPressed: (){
              homeManager.addSection(Section(type: 'List'));
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent
            ),
            child: const Text('Adicionar Lista'),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: (){
              homeManager.addSection(Section(type: 'Staggered'));
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent
            ),
            child: const Text('Adicionar Grade'),
          ),
        ),
      ],
    );
  }
}