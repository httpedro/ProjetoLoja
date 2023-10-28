import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:libelulas/models/cart_manager.dart';
import 'package:libelulas/models/product.dart';

class CheckoutModel extends ChangeNotifier {
  late CartManager cartManager;

  get result => null;

  void updateCart(CartManager cartManager) {
    this.cartManager = cartManager;

    print(cartManager.productsPrice);
  }

  Future<void> checkout() async {
    /*try {
      __decrementStock();
    } catch (e) {
      debugPrint(e.toString());
    }*/
    _getOrderId().then((value) => print(value));
  }

  Future<int> _getOrderId() async {
    final ref = FirebaseFirestore.instance.doc('aux/ordercounter');
    try {
      final result = await FirebaseFirestore.instance.runTransaction(
        (tx) async {
          final doc = await tx.get(ref);
          var datab = doc.data();
          var orderId = datab!['current'] as int;
          await tx.update(ref, {'current': orderId + 1});
          return {'orderId': orderId};
        },
      );
      return result['orderId'] as int;
    } catch (e) {
      return Future.error("falha ao gerar numero do pedido");
    }
  }

  //Future<void>
  __decrementStock() {
    /*final List<Product> productsToUpdate = [];
    final List<Product> productsWithoutStock = [];

    return FirebaseFirestore.instance.runTransaction((tx) async {
      for (var cartProduct in cartManager.items) {
        final doc = await tx.get(FirebaseFirestore.instance
            .doc('products/${cartProduct.productId}'));

        final product = Product.fromDocument(doc);
        final size = product.findSize(cartProduct.itemSize as String);

        if (size!.stock! - (cartProduct.quantity as int) < 0) {
          productsWithoutStock.add(product);
        } else {
          size.stock = -(cartProduct.quantity as int);
          productsToUpdate.add(product);
        }

        productsToUpdate.add(product);
      }

      if (productsWithoutStock.isNotEmpty) {
        return Future.error(
            "${productsWithoutStock.length} produtos sem estoque");
      }

      for (final product in productsToUpdate) {
        tx.update(FirebaseFirestore.instance.doc('products/${product.id}'),
            {'sizes': product.exportSizeList()});
      }
    });
  }*/
  }
}
