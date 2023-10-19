import 'package:libelulas/models/item_size.dart';
import 'package:libelulas/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CartProduct {

  CartProduct.fromProduct(this.product){
    productId = product.id;
    quantity = 1;
    size = product.selectedSize.name;
  }

  CartProduct.fromProduct(DocumentSnapshot document){
        productId = document.data['pid'] as String;
        quantity = document.data ['quantity'] as int;
        size = document.data['size'] as String;

        firestore.document('products/$productId').get().then(
          (doc) => product = Product.fromDocument(document)
        );

      }

    final Firestore firestore = Firestore.instance;

    String productId;
    int quantity;
    String size;

    Product product;


    ItemSize get ItemSize{
      if(product == null) return null;
      return product.findSize(size);
    }

    num get unitPrice {
      if(product == null) return 0;
      return ItemSize?.price ?? 0;
  }

  Map<String, dynamic> toCartItemMap(){
    return {
      'pid': productId,
      'quantity': quantity,
      'size': size,
    };
  }

  bool stackable (Product product){
    return product.id == productId && product.selectedSize.name == size;
  }

}



//feshow