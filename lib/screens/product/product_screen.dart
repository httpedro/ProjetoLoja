import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libelulas/models/cart_manager.dart';
import 'package:libelulas/models/product.dart';
import 'package:libelulas/models/user_manager.dart';
import 'package:libelulas/screens/product/components/size_widget.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    GoogleFonts.carroisGothic();

    return ChangeNotifierProvider.value(
      value: product,
      child: Scaffold(
        appBar: AppBar(
          title: Text(product.name as String),
          centerTitle: true,
          actions: <Widget>[
            Consumer<UsuarioAtenticacao>(
              builder: (_, usuarioAtenticacao, __) {
                if (usuarioAtenticacao.adminEnabled) {
                  return IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                          '/edit_product',
                          arguments: product);
                    },
                  );
                } else {
                  return Container();
                }
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            AspectRatio(
                aspectRatio: 1.6,
                child: CarouselSlider(
                  items: product.images!.map((url) {
                    return Image.network(
                      url,
                      fit: BoxFit.cover,
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 200,
                    enlargeCenterPage: true,
                    viewportFraction: 0.8,
                    enableInfiniteScroll: false,
                    autoPlay: false,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    product.name as String,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'A partir de',
                      style: TextStyle(
                        color: Color.fromARGB(255, 92, 92, 92),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    'R\$ ${(product.basePrice! == double.infinity) ? 'Indisponível' : product.basePrice!.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Descrição',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    product.description!,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Tamanhos',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: product.sizes!.map((s) {
                      return SizeWidget(size: s);
                    }).toList(),
                  ), //wrap
                  const SizedBox(
                    height: 20,
                  ),
                  if (product.hasStock)
                    Consumer2<UsuarioAtenticacao, Product>(
                      builder: (_, usuarioAtenticacao, product, __) {
                        return SizedBox(
                            height: 44,
                            child: ElevatedButton(
                              onPressed: product.selectedSize != null
                                  ? () {
                                      if (usuarioAtenticacao.isLoggedIn) {
                                        context
                                            .read<CartManager>()
                                            .addToCart(product);
                                        Navigator.of(context)
                                            .pushNamed('/cart');
                                      } else {
                                        Navigator.of(context)
                                            .pushNamed('/login');
                                      }
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                foregroundColor: Colors.white,
                              ),
                              child: Text(
                                usuarioAtenticacao.isLoggedIn
                                    ? 'Adicionar ao carrinho'
                                    : 'Entre para comprar',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ));
                      },
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
