import 'package:flutter/material.dart';
import 'package:libelulas/models/cart_manager.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        centerTitle: true,
      ),
      body: Consumer<CartManager>(
        builder: (_, cartManager, __){
          return Column(
            children: cartManager.items.map((cartProduct) => CartTitle(cartProduct)
            ).toList(),
          ); //Column
        },
      ), // Consumer
    ); // Scarfold
  }
}