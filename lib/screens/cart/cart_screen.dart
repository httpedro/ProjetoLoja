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
        centerTitle: true,
      ),
      body: Consumer<CartManager>(
        builder: (_, cartManager, __){
          return ListView(
            children: <Widget>[
              Column(
                children: cartManager.items.map(
                        (cartProduct) => CartTitle(cartProduct)
                ).toList(),
              ), //Column
              PriceCard(
                buttonText: 'Continuar para entrega',
                onPressed: cartManager.isCartValid ? (){

                } : null,
              ),
            ],
          ); 
        },
      ), // Consumer
    ); // Scarfold
  }
}