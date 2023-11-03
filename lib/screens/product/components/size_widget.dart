import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libelulas/models/item_size.dart';
import 'package:libelulas/models/product.dart';
import 'package:provider/provider.dart';

class SizeWidget extends StatelessWidget {
  const SizeWidget({this.size});

  final ItemSize? size;

  @override
  Widget build(BuildContext context) {
    final product = context.watch<Product>();
    final selected = size == product.selectedSize;
    GoogleFonts.carroisGothic();

    Color color;
    if (!size!.hasStock)
      color = Colors.red.withAlpha(50);
    else if (selected)
      color = Theme.of(context).primaryColor;
    else
      color = Colors.grey;

    return GestureDetector(
      onTap: () {
        if (size!.hasStock) {
          product.selectedSize = size;
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: color),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              color: color,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Text(
                size!.name as String,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                'R\$ ${size!.price!.toStringAsFixed(2)}',
                style: TextStyle(
                  color: color,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              child: Text(
                'Estoque: ${size!.stock.toString()}',
                style: TextStyle(
                  color: color,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
