import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:libelulas/models/item_size.dart';
import 'package:libelulas/models/product.dart';

class CartProduct extends ChangeNotifier {
  CartProduct.fromProduct(this.product) {
    productId = product!.id;
    quantity = 1;
    size = product!.selectedSize!.name;
  }

  CartProduct.fromDocument(DocumentSnapshot document) {
    id = document.id;
    productId = document.get('pid') as String;
    quantity = document.get('quantity') as int;
    size = document.get('size') as String;

    firestore.doc('products/$productId').get().then((doc) {
      product = Product.fromDocument(doc);
      notifyListeners();
    });
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? id;

  String? productId;
  int? quantity;
  String? size;

  Product? product;

  ItemSize? get itemSize {
    if (product == null) return null;
    return product!.findSize(size as String);
  }

  num get unitPrice {
    if (product == null) return 0;
    return itemSize!.price ?? 0;
  }

  num get totalPrice => unitPrice * quantity!;

  Map<String, dynamic> toCartItemMap() {
    return {
      'pid': productId,
      'quantity': quantity,
      'size': size,
    };
  }

  Map<String, dynamic> toOrderItemMap() {
    return {
      'pid': productId,
      'quantity': quantity,
      'size': size,
    };
  }

  bool stackable(Product product) {
    return product.id == productId && product.selectedSize!.name == size;
  }

  void increment() {
    quantity = quantity! + 1;
    notifyListeners();
  }

  void decrement() {
    quantity = quantity! - 1;
    notifyListeners();
  }

  bool get hasStock {
    final size = itemSize;
    if (size == null) return false;
    return size.stock! >= quantity!;
  }
}
