import 'package:flutter/material.dart';
import 'package:libelulas/models/section.dart';


class SectionHeader extends StatelessWidget {

    const SectionHeader(this.section);

    final Section section;
    
    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
                section.name as String,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                ),
            ),
        );
    }
}