import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libelulas/models/product_manager.dart';
import 'package:provider/provider.dart';

class SelectProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GoogleFonts.carroisGothic();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vincular Produto'),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(178, 255, 197, 193),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __) {
          return ListView.builder(
            itemCount: productManager.allProducts.length,
            itemBuilder: (_, index) {
              final product = productManager.allProducts[index];
              return ListTile(
                leading: Image.network(product.images!.first),
                title: Text(product.name as String),
                subtitle: Text('R\$ ${product.basePrice!.toStringAsFixed(2)}'),
                onTap: () {
                  Navigator.of(context).pop(product);
                },
              );
            },
          );
        },
      ),
    );
  }
}
