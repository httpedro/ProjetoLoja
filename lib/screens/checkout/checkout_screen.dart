import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libelulas/common/price_card.dart';
import 'package:libelulas/models/cart_manager.dart';
import 'package:libelulas/models/checkout_model.dart';
import 'package:provider/provider.dart';

class checkoutScreen extends StatelessWidget {
  const checkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GoogleFonts.carroisGothic();
    return ChangeNotifierProxyProvider<CartManager, CheckoutModel>(
      create: (_) => CheckoutModel(),
      update: (_, CartManager, CheckoutModel) =>
          CheckoutModel!..updateCart(CartManager),
      lazy: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('pagamento'),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Color.fromARGB(178, 255, 197, 193),
        body: Consumer<CheckoutModel>(
          builder: (_, CheckoutModel, __) {
            return ListView(
              children: [
                PriceCard(
                  buttonText: "finalizar pedido",
                  onPressed: () {
                    CheckoutModel.checkout();
                    Navigator.of(context).pushNamed("/sucess");
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
