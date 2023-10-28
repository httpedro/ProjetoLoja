import 'package:flutter/material.dart';
import 'package:libelulas/common/price_card.dart';
import 'package:libelulas/models/cart_manager.dart';
import 'package:libelulas/screens/cart/components/cart_tile.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        backgroundColor: Colors.transparent, //cabeçalho
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
