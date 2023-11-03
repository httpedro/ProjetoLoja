import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libelulas/common/price_card.dart';
import 'package:libelulas/models/cart_manager.dart';
import 'package:libelulas/screens/cart/components/cart_tile.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GoogleFonts.carroisGothic();
    return Scaffold(
      backgroundColor: Color.fromARGB(178, 255, 197, 193),
      appBar: AppBar(
        title: const Text('Carrinho'),
        backgroundColor: Color.fromARGB(0, 255, 167, 167), //cabeçalho
        centerTitle: true,
      ),
      body: Consumer<CartManager>(
        builder: (_, cartManager, __) {
          return ListView(
            children: <Widget>[
              Column(
                children: cartManager.items
                    .map((cartProduct) => CartTitle(cartProduct))
                    .toList(),
              ), //Column
              PriceCard(
                onPressed: cartManager.isCartValid
                    ? () {
                        Navigator.of(context).pushNamed("/checkout");
                      }
                    : null,
              ),
            ],
          );
        },
      ), // Consumer
    ); // Scarfold
  }
}
