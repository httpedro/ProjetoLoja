import 'package:flutter/material.dart';
import 'package:libelulas/common/price_card.dart';
import 'package:libelulas/models/cart_manager.dart';
import 'package:libelulas/models/checkout_model.dart';
import 'package:provider/provider.dart';

class checkoutScreen extends StatelessWidget {
  const checkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<CartManager, CheckoutModel>(
      create: (_) => CheckoutModel(),
      update: (_, CartManager, CheckoutModel) =>
          CheckoutModel!..updateCart(CartManager),
      lazy: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('pagamento'),
        ),
        body: Consumer<CheckoutModel>(
          builder: (_, CheckoutModel, __) {
            return ListView(
              children: [
                PriceCard(
                  buttonText: "finalizar pedido",
                  onPressed: () {
                    CheckoutModel.checkout();
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
